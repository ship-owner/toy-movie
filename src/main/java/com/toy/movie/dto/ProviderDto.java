package com.toy.movie.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ProviderDto {

    private Integer providerId;
    private String logoPath;
    private String providerName;

}
