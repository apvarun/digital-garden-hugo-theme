---
title: 5. Newsletter
date: 2021-12-18
---

The theme supports a subscription to multiple newsletter providers.

- **Buttondown**
- **Substack**
- **Revue**

## Buttondown

[Params.newsletter.provider] = "buttondown"

Copy the `action` url from your buttondown admin dashboard and add it to **[Params.newsletter.path]** in config.toml

![Buttondown share form URL](https://blog.buttondown.email/img/9.png)


## Substack

[Params.newsletter.provider] = "substack"

Setting up substack is the easiest. Just add your substack newsletter URL (applicable for custom domains also) to **[Params.newsletter.path]** in config.toml

Note that since substack doesn't have a native API for subscription. The theme uses the api from substackapi.com which is in no way associated to Substack itself.

## Revue

Add your revue `username` URL to `Params.newsletter.path` in your config.toml. Once done, the newsletter widget will start showing up in website's sidebar, allowing your visitors to subscribe to your newsletter.

#### How to find your Revue URL to use

Login to your Revue account and go to to `Account Settings`, then the `Integrations` tab. Scroll to the bottom, and click on `Learn more` in **Signup forms** section.

![Revue signup forms](https://downloads.intercomcdn.com/i/o/304891471/587879182e5d9d19aff97d2f/Screenshot+2021-02-26+at+9.10.32+AM.png)

In the next page, you can find the add_subscriber URL.

![Revue URL](https://github.com/apvarun/digital-garden-hugo-theme/blob/main/images/revue-signup-form-url.png?raw=true)

Copy it and use in `config.toml`.

→ [Add Google analytics](/articles/google-analytics)
