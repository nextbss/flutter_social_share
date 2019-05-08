package ao.co.nextbss.flutter_social_share;

import com.facebook.FacebookException;

import java.util.HashMap;
import java.util.Map;

class FacebookShareResultHandler {
    static Map<String, String> success(final String postId) {
        return new HashMap<String, String>() {{
            put("status", "success");
            put("postId", postId);
        }};
    }

    static Map<String, String> error(final FacebookException ex) {
        return new HashMap<String, String>() {{
           put("status", "error");
           put("errorMessage", ex.getLocalizedMessage());
        }};
    }

    static Map<String, String> cancelledByUser() {
        return new HashMap<String, String>() {{
           put("status", "cancelledByUser");
        }};
    }
}
