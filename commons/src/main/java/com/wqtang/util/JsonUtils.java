package com.wqtang.util;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author Wenqian Tang
 * @date 2023/3/9
 */
public class JsonUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(JsonUtils.class);

    private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper()
            .enable(SerializationFeature.INDENT_OUTPUT)
            .enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)
            .disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);

    /** null fields will be removed when serializing */
    private static final ObjectMapper OBJECT_MAPPER_NOT_NULL = new ObjectMapper()
            .enable(SerializationFeature.INDENT_OUTPUT)
            .enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)
            .disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES)
            .setSerializationInclusion(JsonInclude.Include.NON_NULL);

    /** null or empty fields will be removed when serializing */
    private static final ObjectMapper OBJECT_MAPPER_NOT_EMPTY = new ObjectMapper()
            .enable(SerializationFeature.INDENT_OUTPUT)
            .enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)
            .disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES)
            .setSerializationInclusion(JsonInclude.Include.NON_EMPTY);

    public static String getJson(Object object) {
        try {
            return OBJECT_MAPPER.writer().writeValueAsString(object);
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `JsonUtils.getJson`, object = {}, error message is {}",
                    object, e.getMessage(), e);
            return "";
        }
    }

    public static String getPrettyJson(Object object) {
        try {
            return OBJECT_MAPPER.writerWithDefaultPrettyPrinter().writeValueAsString(object);
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `JsonUtils.getPrettyJson`, object = {}, error message is {}",
                    object, e.getMessage(), e);
            return "";
        }
    }

    public static String getPrettyJsonExcludeNullProperty(Object object) {
        try {
            return OBJECT_MAPPER_NOT_NULL.writerWithDefaultPrettyPrinter().writeValueAsString(object);
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `JsonUtils.getPrettyJsonExcludeNullProperty`, object = {}, error message is {}",
                    object, e.getMessage(), e);
            return "";
        }
    }

    public static String getPrettyJsonExcludeEmptyProperty(Object object) {
        try {
            return OBJECT_MAPPER_NOT_EMPTY.writerWithDefaultPrettyPrinter().writeValueAsString(object);
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `JsonUtils.getPrettyJsonExcludeEmptyProperty`, object = {}, error message is {}",
                    object, e.getMessage(), e);
            return "";
        }
    }

    public static <T> T readValue(String jsonStr, Class<T> clazz) {
        try {
            return OBJECT_MAPPER.readValue(jsonStr, clazz);
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `JsonUtils.readValue`, jsonStr = {}, class = {}, error message is {}",
                    jsonStr, clazz.getName(), e.getMessage(), e);
            throw new RuntimeException(e);
        }
    }

    public static <T> T readValue(String jsonStr, TypeReference<T> type) {
        try {
            return OBJECT_MAPPER.readValue(jsonStr, type);
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `JsonUtils.readValue`, jsonStr = {}, error message is {}",
                    jsonStr, e.getMessage(), e);
            throw new RuntimeException(e);
        }
    }

    public static <T> T convertValue(Object object, Class<T> clazz) {
        try {
            return OBJECT_MAPPER.convertValue(object, clazz);
        } catch (Exception e) {
            LOGGER.error("Exception occurs in `JsonUtils.convertValue`, object = {}, class = {}, error message is {}",
                    object, clazz.getName(), e.getMessage(), e);
            throw new RuntimeException(e);
        }
    }

}
