package com.nt.service;

import com.kwabenaberko.newsapilib.NewsApiClient;
import com.kwabenaberko.newsapilib.models.request.EverythingRequest;
import com.kwabenaberko.newsapilib.models.response.ArticleResponse;
import org.springframework.stereotype.Service;

import java.util.concurrent.CompletableFuture;

@Service
public class NewsApiService {

    private final NewsApiClient newsApiClient;

    public NewsApiService() {
    	System.out.println("NewsApiService.NewsApiService()");
        this.newsApiClient = new NewsApiClient("1a32851a18764014b594a2c9177a34b5"); // 🔑 replace
    }

    public CompletableFuture<ArticleResponse> getNews(String keyword) {
    	System.out.println("NewsApiService.getNews()");
        CompletableFuture<ArticleResponse> future = new CompletableFuture<>();

        newsApiClient.getEverything(
            new EverythingRequest.Builder()
                .q(keyword)
                .language("en")
                .pageSize(10)
                .build(),
            new NewsApiClient.ArticlesResponseCallback() {
                @Override
                public void onSuccess(ArticleResponse response) {
                    future.complete(response);
                }

                @Override
                public void onFailure(Throwable throwable) {
                    future.completeExceptionally(throwable);
                }
            }
        );

        return future;
    }
}
