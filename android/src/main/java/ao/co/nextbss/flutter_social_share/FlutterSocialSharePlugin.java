package ao.co.nextbss.flutter_social_share;

import android.net.Uri;

import com.facebook.CallbackManager;
import com.facebook.FacebookCallback;
import com.facebook.FacebookException;
import com.facebook.share.Sharer;
import com.facebook.share.model.ShareLinkContent;
import com.facebook.share.widget.ShareDialog;
import com.twitter.sdk.android.tweetcomposer.TweetComposer;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class FlutterSocialSharePlugin implements MethodCallHandler {
    private static final String METHOD_SHARE_LINK_TO_FACEBOOK = "shareLinkToFacebook";
    private static final String ARGUMENT_CONTENT_URI = "contentUrl";

    private static final String METHOD_TWEET = "tweet";
    private static final String ARGUMENT_CONTENT_TEXT = "contentText";

    private final Registrar registrar;

    private FlutterSocialSharePlugin(Registrar registrar) {
        assert(registrar != null);
        this.registrar = registrar;
    }

    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_social_share");
        channel.setMethodCallHandler(new FlutterSocialSharePlugin(registrar));
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        switch (call.method) {
            case METHOD_SHARE_LINK_TO_FACEBOOK:
                String uriToShare = call.argument(ARGUMENT_CONTENT_URI);
                shareLinkToFacebook(uriToShare, result);
                break;
            case METHOD_TWEET:
                String textToTweet = call.argument(ARGUMENT_CONTENT_TEXT);
                tweet(textToTweet, result);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void shareLinkToFacebook(String uriToShare, final Result result) {
        ShareLinkContent shareLinkContent = new ShareLinkContent.Builder()
                .setContentUrl(Uri.parse(uriToShare))
                .build();

        ShareDialog shareDialog = new ShareDialog(registrar.activity());
        shareDialog.registerCallback(CallbackManager.Factory.create(), new FacebookCallback<Sharer.Result>() {
            @Override
            public void onSuccess(Sharer.Result shareResult) {
                result.success(FacebookShareResultHandler.success(
                        shareResult.getPostId()));
            }

            @Override
            public void onCancel() {
                result.success(FacebookShareResultHandler.cancelledByUser());
            }

            @Override
            public void onError(FacebookException ex) {
                result.success(FacebookShareResultHandler.error(ex));
            }
        });

        ShareDialog.show(registrar.activity(), shareLinkContent);
    }

    private void tweet(String textToTweet, final Result result) {
        new TweetComposer.Builder(registrar.activity())
                .text(textToTweet)
                .show();
        result.success(true);
    }
}
