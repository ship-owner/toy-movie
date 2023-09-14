package com.toy.movie.external;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.toy.movie.dto.GenresDto;
import com.toy.movie.dto.MovieDto;
import com.toy.movie.dto.MovieSearchDto;
import com.toy.movie.dto.ProviderDto;
import io.micrometer.common.util.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.*;

/**
 * packageName    : com.toy.movie.api
 * fileName       : TmdbApiModule.java
 * author         : shipowner
 * date           : 2023-09-11
 * description    : TMDB API 모듈
 */
@Component
public class TmdbApiModule {

    @Value("#{movieProp['tmdb.api.url']}")
    private String tmdbApiUrl;
    @Value("#{movieProp['tmdb.api.token']}")
    private String tmdbApiToken;

    private String language = "ko-KR";
    private String watch_region = "KR";

    /**
     * methodName : getMovieTrends
     * author : shipowner
     * description : 최신 인기 영화 목록 조회
     * @return list
     */
    public List<MovieDto> getMovieTrends() {
        List<MovieDto> movieList = null;

        try {
            String baseUrl = tmdbApiUrl + "/trending/movie/week";

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


    /**
     * methodName : getMovieProviders
     * author : shipowner
     * description : 전체 OTT 조회
     * @return list
     */
    public List<ProviderDto> getMovieProviders() {
        List<ProviderDto> providerList = null;

        try {
            String baseUrl = tmdbApiUrl + "/watch/providers/movie";

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

    /**
     * methodName : getMovieGenres
     * author : shipowner
     * description : 전체 장르 조회
     * @return list
     */
    public List<GenresDto> getMovieGenres(){
        List<GenresDto> genresList = null;

        try {
            String baseUrl = tmdbApiUrl + "/genre/movie/list";

            Map<String, String> queryParams = new HashMap<>();
            queryParams.put("language", language);

            String jsonData = this.getResponseText(baseUrl, queryParams);

            if(StringUtils.isNotBlank(jsonData)) {
                JSONObject jsonObject = new JSONObject(jsonData);

                if(jsonObject.has("genres")) {
                    String genres = jsonObject.get("genres").toString();

                    ObjectMapper mapper = new ObjectMapper()
                            .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)
                            .setPropertyNamingStrategy(PropertyNamingStrategy.CAMEL_CASE_TO_LOWER_CASE_WITH_UNDERSCORES);

                    genresList = new ArrayList<>();
                    genresList = Arrays.asList(mapper.readValue(genres, GenresDto[].class));

                    System.out.println();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return genresList;
    }


    /**
     * methodName : findMovieDetailByMovieId
     * author : shipowner
     * description : 영화 정보 상세 조회
     * @param movieId
     * @return movie dto
     */
    public MovieDto findMovieDetailByMovieId(Integer movieId){
        MovieDto movieDto = null;

        try {
            String baseUrl = tmdbApiUrl + "/movie/" + movieId;

            Map<String, String> queryParams = new HashMap<>();
            queryParams.put("language", language);

            String jsonData = this.getResponseText(baseUrl, queryParams);

            if(StringUtils.isNotBlank(jsonData)) {
                ObjectMapper mapper = new ObjectMapper()
                        .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)
                        .setPropertyNamingStrategy(PropertyNamingStrategy.CAMEL_CASE_TO_LOWER_CASE_WITH_UNDERSCORES);

                movieDto = mapper.readValue(jsonData, MovieDto.class);

                System.out.println();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return movieDto;
    }

    /**
     * methodName : findMovieProviderByMovieId
     * author : shipowner
     * description : 영화 OTT 제공 목록 조회
     * @param movieId
     * @return list
     */
    public List<ProviderDto> findMovieProviderByMovieId(Integer movieId){
        List<ProviderDto> providerList = null;

        try {
            String baseUrl = tmdbApiUrl + "/movie/"+movieId+"/watch/providers";

            String jsonData = this.getResponseText(baseUrl, null);

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

    /**
     * methodName : findMovieList
     * author : shipowner
     * description : 필터를 통한 영화 목록 조회
     * @param movieSearchDto
     * @return list
     */
    public List<MovieDto> findMovieList(MovieSearchDto movieSearchDto){
        List<MovieDto> movieList = null;

        try {
            String baseUrl = tmdbApiUrl + "/discover/movie";

            Map<String, String> queryParams = new HashMap<>();
            queryParams.put("language", language);

            if(StringUtils.isNotBlank(movieSearchDto.getPage())) queryParams.put("page",movieSearchDto.getPage());
            if(StringUtils.isNotBlank(movieSearchDto.getYear())) queryParams.put("year",movieSearchDto.getYear());
            if(movieSearchDto.getWithGenres() != null && movieSearchDto.getWithGenres().size() > 0)
                queryParams.put("with_genres",String.join("|",movieSearchDto.getWithGenres()));
            if(movieSearchDto.getWithCompanies() != null && movieSearchDto.getWithCompanies().size() > 0)
                queryParams.put("with_companies",String.join("|",movieSearchDto.getWithCompanies()));
            if(movieSearchDto.getWithKeywords() != null && movieSearchDto.getWithKeywords().size() > 0)
                queryParams.put("with_keywords",String.join("|",movieSearchDto.getWithKeywords()));
            if(movieSearchDto.getWithWatchProviders() != null && movieSearchDto.getWithWatchProviders().size() > 0)
                queryParams.put("with_watch_providers",String.join("|",movieSearchDto.getWithWatchProviders()));

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

    private String getResponseText(String baseUrl, Map<String, String> queryParams) {
        String responseText = null;

        StringBuilder uriBuilder = new StringBuilder(baseUrl);

        if(queryParams != null) {
            uriBuilder.append("?");
            queryParams.forEach((key, value) -> {
                uriBuilder.append(key).append("=").append(URLEncoder.encode(value)).append("&");
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
