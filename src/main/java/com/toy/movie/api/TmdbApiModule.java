package com.toy.movie.api;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.toy.movie.dto.MovieDto;
import com.toy.movie.dto.ProviderDto;
import io.micrometer.common.util.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.*;

@Component
public class TmdbApiModule {

    @Value("#{movieProp['tmdb.api.url']}")
    private String tmdbApiUrl;
    @Value("#{movieProp['tmdb.api.token']}")
    private String tmdbApiToken;

    private String language = "ko-KR";
    private String watch_region = "KR";

    public List<MovieDto> getMovieTrends() {
        List<MovieDto> movieList = null;

        try {
            String baseUrl = tmdbApiUrl + "trending/movie/week";

            Map<String, String> queryParams = new HashMap<>();
            queryParams.put("language", language);

            String jsonData = this.getResponseText(baseUrl, queryParams);

            if(StringUtils.isNotBlank(jsonData)) {
                JSONObject jsonObject = new JSONObject(jsonData);

                if(jsonObject.has("results")) {
                    String results = jsonObject.get("results").toString();

                    ObjectMapper mapper = new ObjectMapper()
                            .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)
                            .setPropertyNamingStrategy(PropertyNamingStrategy.CAMEL_CASE_TO_LOWER_CASE_WITH_UNDERSCORES);

                    movieList = new ArrayList<>();
                    movieList = Arrays.asList(mapper.readValue(results, MovieDto[].class));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return movieList;
    }

    public List<ProviderDto> getMovieProvider() {
        List<ProviderDto> providerList = null;

        try {
            String baseUrl = tmdbApiUrl + "watch/providers/movie";

            Map<String, String> queryParams = new HashMap<>();
            queryParams.put("language", language);
            queryParams.put("watch_region", watch_region);

            String jsonData = this.getResponseText(baseUrl, queryParams);

            if(StringUtils.isNotBlank(jsonData)) {
                JSONObject jsonObject = new JSONObject(jsonData);

                if(jsonObject.has("results")) {
                    String results = jsonObject.get("results").toString();

                    ObjectMapper mapper = new ObjectMapper()
                            .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)
                            .setPropertyNamingStrategy(PropertyNamingStrategy.CAMEL_CASE_TO_LOWER_CASE_WITH_UNDERSCORES);


                    providerList = new ArrayList<>();
                    providerList = Arrays.asList(mapper.readValue(results, ProviderDto[].class));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return providerList;
    }

    private String getResponseText(String baseUrl, Map<String, String> queryParams) {
        String responseText = null;

        StringBuilder uriBuilder = new StringBuilder(baseUrl);

        if(queryParams != null) {
            uriBuilder.append("?");
            queryParams.forEach((key, value) -> {
                uriBuilder.append(key).append("=").append(value).append("&");
            });
        }

        try {
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(uriBuilder.toString()))
                    .header("accept", "application/json")
                    .header("Authorization", tmdbApiToken)
                    .GET()
                    .build();

            HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
            responseText = response.body();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return responseText;
    }

}
