Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFB8CA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 15:26:06 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.14573.1755271559945952906
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 08:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=GLE/MKJC;
 spf=pass (domain: criticallink.com, ip: 209.85.219.178, mailfrom: jcormier@criticallink.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e931cc4c9e4so2069208276.2
        for <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1755271559; x=1755876359; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lp+oBNygJxNPldgtyITftFTGtOVOVmLrnI1g+tCZkQQ=;
        b=GLE/MKJC9glYb/I8t6aUTWcgdE60p/Mbet+GcYxohhUgkd5p0bi3OHYPBNJR2PwvBN
         eJ1WbPQLCpZVCGwqm93gsfa3GDcvXyppu3ZFldjVgi1e2w2Q7YHZ+7+k4ctmUoDOH1uZ
         reesllQ7mzTFtylTU6ImiCO2zxZZHjHKXJLuuWDYnt13XSWKbMiPL8+Q0TSzZ2DwAmUB
         ATpm/6j4pGLbfkom7WwZSs9WYIa9aZXb0nSyegSuWwpMggo1yPBYsFx7hoUZtpvKoaUz
         KeH8Mc3mlDWk2DxJVLIsqME4G5SpIpl+SUElk0SMeoKpsr9ahyK7DO2SiyyxOeoEWNKH
         ta8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755271559; x=1755876359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lp+oBNygJxNPldgtyITftFTGtOVOVmLrnI1g+tCZkQQ=;
        b=k2gZ0XRDLiUCYGkIKRDcn72NQiVdjHKt70Rcn8Q/ixkeJFfJjqhdbh4x4nxE5bgrS7
         y84pKVHSPrLkSbUClCKfJ6X7Xy5fx1VqowImpW1xDau3jibq+HxM8pD3W6ojuXqOwmUR
         f1X9NJMVMsMRKAdY7d54EYi55kwjwcJvI0IIXK8uHYWqU9drKEzfcnd0BlmVkh9AO4H2
         DMVPh7/FPnuvm51e2lK7GHEgQb7wB/Gqzpn2iqSUyEBHCfUU/y/oKbTQhmDsW1RjMxU7
         TUOijQb6ZA7rWswmcM2Bur0TBApI/40hrkd18EfBCWYI0feakGOELwQ9D/+oCGlFDEJ1
         HsxA==
X-Forwarded-Encrypted: i=1; AJvYcCXRBOQ2exXJQQ9ZwjqvVljptGfv0s5EJ5AhEnA9jVpDAdt7NzIf9/MzlB8ZMJmbbIopVvzbZGEzniVi@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxqAX+Ww5gtcoqtGxKUHWuf6yr3KWPq+83H5I+HVs0S2+gfNg/O
	RyMrL44qhkcAuYvN8uckOoQsoczTKWwDf6YACBDYOBq2++vgzVnvLK4w9FcLNTaUwvwsAoKpVcB
	DiRMJ/3NaAywhNUofd0iYTFAFblk0qwjGvb1VjG8w
X-Gm-Gg: ASbGncv7zzwA9qHiXdNYgLgGPZBRbGhHReoisiqY6T8fxnJbLqHN/us597h/fBZBhVZ
	Q4a7DfCZ6d/pgZwDmEZpLd6ZMhtL8ZIxu3WF3Wy4Q61yt5SKlO0fQ+C8DZaSX2CkL3xqas6lxN0
	2SJUb8Vmz6qDrV7L6jww+gZc1Sd+i7J9h5DeNAr+IXJWf+FS3CPsTa61MPbIgCLoIce938Ds/kX
	M75FCWnMz2Skjen
X-Google-Smtp-Source: AGHT+IHi5RNBCWULR9Ba4/W62iWhMfIHrQ6DhtqADhOY/JC+f8BX4sYMr7eHYzUmBFKWVM01qHVwvWLRpWgs/YjQY6A=
X-Received: by 2002:a05:6902:70f:b0:e93:3609:762c with SMTP id
 3f1490d57ef6-e93360978f4mr2349499276.23.1755271557999; Fri, 15 Aug 2025
 08:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250814232955.1559040-1-rs@ti.com> <20250814232955.1559040-3-rs@ti.com>
In-Reply-To: <20250814232955.1559040-3-rs@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Fri, 15 Aug 2025 11:25:45 -0400
X-Gm-Features: Ac12FXy5eVxGzZfC14WZbzoXK3ehMFhDbZo4JFbQABzPZfjy19YgFslKBeplIVo
Message-ID: <CADL8D3YwWvVtodQehpL9aL_ytqnjOEF26JRw+KPpjFDdFmB5Og@mail.gmail.com>
Subject: Re: [meta-arago] [oe-layersetup][PATCH 2/2] kas: regenerate all
 configs to include bitbake
To: rs@ti.com
Cc: reatmon@ti.com, denis@denix.org, a-christidis@ti.com, 
	meta-arago@lists.yoctoproject.org, nm@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 15:26:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16475

Is there any simple guide on using kas for the TI builds?

If I try on ubuntu 24.04, what the kas documentation says, I get a
very minimal and unhelpful failure... With seemingly no way to turn on
additional logging.  The build directory is empty as well.

$ kas-container build
kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
2025-08-15 11:22:38 - INFO     - kas 4.8.2 started
2025-08-15 11:22:38 - WARNING  - Falling back to file-relative
addressing of local include "../templates/bblayers.conf.yml"
2025-08-15 11:22:38 - WARNING  - Update your layer to repo-relative
addressing to avoid this warning
2025-08-15 11:22:38 - WARNING  - Falling back to file-relative
addressing of local include "../templates/local-arago64-v2.conf.yml"
2025-08-15 11:22:38 - WARNING  - Update your layer to repo-relative
addressing to avoid this warning
2025-08-15 11:22:38 - WARNING  - 11.00.09.04 is not a full-length hash
for repo "meta-tisdk". This will be an error in future versions.
2025-08-15 11:22:38 - WARNING  - 11.00.09 is not a full-length hash
for repo "meta-arago". This will be an error in future versions.
2025-08-15 11:22:38 - WARNING  - 11.00.09 is not a full-length hash
for repo "meta-ti". This will be an error in future versions.
2025-08-15 11:22:38 - INFO     - Repository meta-tisdk already
contains 11.00.09.04 as tag
2025-08-15 11:22:38 - INFO     - Repository meta-arago already
contains 11.00.09 as tag
2025-08-15 11:22:38 - INFO     - Repository meta-qt6 already contains
78855ecc613fcd6eff1a5a012cab5e679df329e4 as commit
2025-08-15 11:22:38 - INFO     - Repository meta-virtualization
already contains 0c191912421adff2f753e470056a9a525fbce760 as commit
2025-08-15 11:22:38 - INFO     - Repository meta-openembedded already
contains edd1a1e284fdcb80cd48d411f235d47f23bc27ae as commit
2025-08-15 11:22:38 - INFO     - Repository meta-ti already contains
11.00.09 as tag
2025-08-15 11:22:38 - INFO     - Repository meta-arm already contains
3cadb81ffaa9f03b92e302843cb22a9cd41df34b as commit
2025-08-15 11:22:38 - INFO     - Repository meta-clang already
contains b9ef02282197380ef05edbd0eb852e1934ceb59b as commit
2025-08-15 11:22:38 - INFO     - Repository oe-core already contains
1be6d83466e3a0da4222ba502c2a86c25c835a35 as commit
2025-08-15 11:22:38 - INFO     - Repository meta-tisdk checked out to
11.00.09.04
2025-08-15 11:22:38 - INFO     - Repository meta-arago checked out to 11.00=
.09
2025-08-15 11:22:38 - INFO     - Repository meta-qt6 checked out to
78855ecc613fcd6eff1a5a012cab5e679df329e4
2025-08-15 11:22:38 - INFO     - Repository meta-virtualization
checked out to 0c191912421adff2f753e470056a9a525fbce760
2025-08-15 11:22:38 - INFO     - Repository meta-openembedded checked
out to edd1a1e284fdcb80cd48d411f235d47f23bc27ae
2025-08-15 11:22:38 - INFO     - Repository meta-ti checked out to 11.00.09
2025-08-15 11:22:38 - INFO     - Repository meta-arm checked out to
3cadb81ffaa9f03b92e302843cb22a9cd41df34b
2025-08-15 11:22:38 - INFO     - Repository meta-clang checked out to
b9ef02282197380ef05edbd0eb852e1934ceb59b
2025-08-15 11:22:38 - INFO     - Repository oe-core checked out to
1be6d83466e3a0da4222ba502c2a86c25c835a35
2025-08-15 11:22:38 - ERROR    - Command "/tmp/tmp_qqetik6/get_bb_env
/work/build" failed with error 1


On Thu, Aug 14, 2025 at 7:30=E2=80=AFPM Randolph Sapp via
lists.yoctoproject.org <rs=3Dti.com@lists.yoctoproject.org> wrote:
>
> From: Randolph Sapp <rs@ti.com>
>
> Regenerate all kas configs to include the bitbake repo definition.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  kas/arago-kirkstone-chromium-config.yml                    | 6 ++++++
>  kas/arago-kirkstone-config.yml                             | 6 ++++++
>  kas/arago-kirkstone-next-config.yml                        | 6 ++++++
>  kas/arago-kirkstone-wip-config.yml                         | 6 ++++++
>  kas/arago-master-chromium-config.yml                       | 6 ++++++
>  kas/arago-master-config.yml                                | 6 ++++++
>  kas/arago-master-next-config.yml                           | 6 ++++++
>  kas/arago-master-selinux-config.yml                        | 6 ++++++
>  kas/arago-master-wip-config.yml                            | 6 ++++++
>  kas/arago-scarthgap-10x-config.yml                         | 6 ++++++
>  kas/arago-scarthgap-10x-next-config.yml                    | 6 ++++++
>  kas/arago-scarthgap-chromium-config.yml                    | 6 ++++++
>  kas/arago-scarthgap-config.yml                             | 6 ++++++
>  kas/arago-scarthgap-next-config.yml                        | 6 ++++++
>  kas/arago-scarthgap-selinux-config.yml                     | 6 ++++++
>  kas/arago-scarthgap-wip-config.yml                         | 6 ++++++
>  kas/coresdk/coresdk-09.00.00.006-config.yml                | 7 +++++++
>  kas/coresdk/coresdk-09.00.00.007-config.yml                | 7 +++++++
>  kas/coresdk/coresdk-09.00.00.011-config.yml                | 7 +++++++
>  kas/coresdk/coresdk-09.01.00.001-config.yml                | 7 +++++++
>  kas/coresdk/coresdk-09.01.00.003-config.yml                | 7 +++++++
>  kas/coresdk/coresdk-09.01.00.007-config.yml                | 7 +++++++
>  kas/coresdk/coresdk-09.01.00.008-config.yml                | 7 +++++++
>  kas/coresdk/coresdk-09.02.00.008-config.yml                | 7 +++++++
>  kas/coresdk/coresdk-09.02.00.009-config.yml                | 7 +++++++
>  kas/coresdk/coresdk-09.02.00.010-config.yml                | 7 +++++++
>  kas/coresdk/coresdk-09.03.05-config.yml                    | 7 +++++++
>  kas/coresdk/coresdk-10.00.07-config.yml                    | 7 +++++++
>  kas/coresdk/coresdk-10.01.08-config.yml                    | 7 +++++++
>  kas/coresdk/coresdk-10.01.10-config.yml                    | 7 +++++++
>  kas/coresdk/coresdk-10.01.10-selinux-config.yml            | 7 +++++++
>  kas/coresdk/coresdk-11.00.09-config.yml                    | 7 +++++++
>  kas/coresdk/coresdk-11.00.15-config.yml                    | 7 +++++++
>  kas/coresdk/coresdk-11.01.05-config.yml                    | 7 +++++++
>  kas/distroless-kirkstone-config.yml                        | 6 ++++++
>  kas/distroless-master-config.yml                           | 6 ++++++
>  kas/distroless-scarthgap-config.yml                        | 6 ++++++
>  kas/poky-kirkstone-config.yml                              | 6 ++++++
>  kas/poky-master-config.yml                                 | 6 ++++++
>  kas/poky-master-wip-config.yml                             | 6 ++++++
>  kas/poky-scarthgap-config.yml                              | 6 ++++++
>  kas/poky-scarthgap-wip-config.yml                          | 6 ++++++
>  .../processor-sdk-analytics-09.00.00-config.yml            | 7 +++++++
>  .../processor-sdk-analytics-09.00.01-config.yml            | 7 +++++++
>  .../processor-sdk-analytics-09.01.00-config.yml            | 7 +++++++
>  .../processor-sdk-analytics-09.02.00-config.yml            | 7 +++++++
>  .../processor-sdk-analytics-10.00.00-config.yml            | 7 +++++++
>  .../processor-sdk-analytics-10.01.00-config.yml            | 7 +++++++
>  .../processor-sdk-analytics-11.00.00-config.yml            | 7 +++++++
>  .../processor-sdk-analytics-11.01.07.05-config.yml         | 7 +++++++
>  .../processor-sdk-analytics-selinux-11.01.07.05-config.yml | 7 +++++++
>  kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml    | 7 +++++++
>  .../processor-sdk-linux-09_00_00_06.yml                    | 7 +++++++
>  .../processor-sdk-linux-09_00_00_07.yml                    | 7 +++++++
>  .../processor-sdk-linux-09_01_00_06.yml                    | 7 +++++++
>  .../processor-sdk-linux-09_01_00_07.yml                    | 7 +++++++
>  .../processor-sdk-linux-09_02_00_04.yml                    | 7 +++++++
>  .../processor-sdk-linux-09_02_00_05.yml                    | 7 +++++++
>  .../processor-sdk-linux-09_03_06_05.yml                    | 7 +++++++
>  .../processor-sdk-linux-10_00_07_06.yml                    | 7 +++++++
>  .../processor-sdk-linux-10_00_08_06.yml                    | 7 +++++++
>  .../processor-sdk-linux-10_01_08_01.yml                    | 7 +++++++
>  .../processor-sdk-09.00.00-am62xxsip-config.yml            | 7 +++++++
>  kas/processor-sdk/processor-sdk-09.00.00-config.yml        | 7 +++++++
>  kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml | 7 +++++++
>  kas/processor-sdk/processor-sdk-09.01.00-config.yml        | 7 +++++++
>  kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml | 7 +++++++
>  .../processor-sdk-09.02.00.08-am64x-config.yml             | 7 +++++++
>  .../processor-sdk-09.03.05.02-legacy-config.yml            | 7 +++++++
>  .../processor-sdk-11.00.05.02-am62lxx-config.yml           | 7 +++++++
>  .../processor-sdk-11.00.15.05-am62lxx-config.yml           | 7 +++++++
>  .../processor-sdk-kirkstone-09.02.01.09-config.yml         | 7 +++++++
>  .../processor-sdk-kirkstone-09.02.01.10-config.yml         | 7 +++++++
>  ...processor-sdk-kirkstone-chromium-09.02.01.09-config.yml | 7 +++++++
>  ...processor-sdk-kirkstone-chromium-09.02.01.10-config.yml | 7 +++++++
>  .../processor-sdk-scarthgap-10.00.07.04-config.yml         | 7 +++++++
>  .../processor-sdk-scarthgap-10.01.10.04-config.yml         | 7 +++++++
>  .../processor-sdk-scarthgap-11.00.09.04-config.yml         | 7 +++++++
>  .../processor-sdk-scarthgap-11.01.05.03-config.yml         | 7 +++++++
>  ...processor-sdk-scarthgap-chromium-10.00.07.04-config.yml | 7 +++++++
>  ...processor-sdk-scarthgap-chromium-10.01.10.04-config.yml | 7 +++++++
>  ...processor-sdk-scarthgap-chromium-11.00.09.04-config.yml | 7 +++++++
>  ...processor-sdk-scarthgap-chromium-11.01.05.03-config.yml | 7 +++++++
>  .../processor-sdk-scarthgap-nonqt-11.01.05.03-config.yml   | 7 +++++++
>  .../processor-sdk-scarthgap-selinux-11.00.09.04-config.yml | 7 +++++++
>  .../processor-sdk-scarthgap-selinux-11.01.05.03-config.yml | 7 +++++++
>  86 files changed, 578 insertions(+)
>
> diff --git a/kas/arago-kirkstone-chromium-config.yml b/kas/arago-kirkston=
e-chromium-config.yml
> index 3903a5f..5998939 100644
> --- a/kas/arago-kirkstone-chromium-config.yml
> +++ b/kas/arago-kirkstone-chromium-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/arago-kirkstone-config.yml b/kas/arago-kirkstone-config.=
yml
> index 15318ae..b568e1e 100644
> --- a/kas/arago-kirkstone-config.yml
> +++ b/kas/arago-kirkstone-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/arago-kirkstone-next-config.yml b/kas/arago-kirkstone-ne=
xt-config.yml
> index 079a7da..352d920 100644
> --- a/kas/arago-kirkstone-next-config.yml
> +++ b/kas/arago-kirkstone-next-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone-next"
> diff --git a/kas/arago-kirkstone-wip-config.yml b/kas/arago-kirkstone-wip=
-config.yml
> index 1d56afe..e2b3c90 100644
> --- a/kas/arago-kirkstone-wip-config.yml
> +++ b/kas/arago-kirkstone-wip-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone-wip"
> diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chro=
mium-config.yml
> index 99168f6..f2ba0e8 100644
> --- a/kas/arago-master-chromium-config.yml
> +++ b/kas/arago-master-chromium-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "master"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "master"
> diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
> index b7855b8..c3f1696 100644
> --- a/kas/arago-master-config.yml
> +++ b/kas/arago-master-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "master"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "master"
> diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-con=
fig.yml
> index a678b03..cd4931d 100644
> --- a/kas/arago-master-next-config.yml
> +++ b/kas/arago-master-next-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "master"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "master-next"
> diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selin=
ux-config.yml
> index 41070ec..d1d3656 100644
> --- a/kas/arago-master-selinux-config.yml
> +++ b/kas/arago-master-selinux-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "master"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "master"
> diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-confi=
g.yml
> index f1628d0..1b90f07 100644
> --- a/kas/arago-master-wip-config.yml
> +++ b/kas/arago-master-wip-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "master"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "master-wip"
> diff --git a/kas/arago-scarthgap-10x-config.yml b/kas/arago-scarthgap-10x=
-config.yml
> index 8ddd524..747b4a1 100644
> --- a/kas/arago-scarthgap-10x-config.yml
> +++ b/kas/arago-scarthgap-10x-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/arago-scarthgap-10x-next-config.yml b/kas/arago-scarthga=
p-10x-next-config.yml
> index 0972ecf..2fd06a3 100644
> --- a/kas/arago-scarthgap-10x-next-config.yml
> +++ b/kas/arago-scarthgap-10x-next-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap-next"
> diff --git a/kas/arago-scarthgap-chromium-config.yml b/kas/arago-scarthga=
p-chromium-config.yml
> index 5dec40f..231374c 100644
> --- a/kas/arago-scarthgap-chromium-config.yml
> +++ b/kas/arago-scarthgap-chromium-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/arago-scarthgap-config.yml b/kas/arago-scarthgap-config.=
yml
> index ff34372..975023c 100644
> --- a/kas/arago-scarthgap-config.yml
> +++ b/kas/arago-scarthgap-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/arago-scarthgap-next-config.yml b/kas/arago-scarthgap-ne=
xt-config.yml
> index 5b1a5fd..0410b72 100644
> --- a/kas/arago-scarthgap-next-config.yml
> +++ b/kas/arago-scarthgap-next-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap-next"
> diff --git a/kas/arago-scarthgap-selinux-config.yml b/kas/arago-scarthgap=
-selinux-config.yml
> index e2917f6..4192974 100644
> --- a/kas/arago-scarthgap-selinux-config.yml
> +++ b/kas/arago-scarthgap-selinux-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/arago-scarthgap-wip-config.yml b/kas/arago-scarthgap-wip=
-config.yml
> index 0305611..20c4448 100644
> --- a/kas/arago-scarthgap-wip-config.yml
> +++ b/kas/arago-scarthgap-wip-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap-wip"
> diff --git a/kas/coresdk/coresdk-09.00.00.006-config.yml b/kas/coresdk/co=
resdk-09.00.00.006-config.yml
> index 35c98ba..9b983cf 100644
> --- a/kas/coresdk/coresdk-09.00.00.006-config.yml
> +++ b/kas/coresdk/coresdk-09.00.00.006-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/coresdk/coresdk-09.00.00.007-config.yml b/kas/coresdk/co=
resdk-09.00.00.007-config.yml
> index 266ea75..b42873f 100644
> --- a/kas/coresdk/coresdk-09.00.00.007-config.yml
> +++ b/kas/coresdk/coresdk-09.00.00.007-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/coresdk/coresdk-09.00.00.011-config.yml b/kas/coresdk/co=
resdk-09.00.00.011-config.yml
> index 92ce332..9099cbf 100644
> --- a/kas/coresdk/coresdk-09.00.00.011-config.yml
> +++ b/kas/coresdk/coresdk-09.00.00.011-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "41b6684489d0261753344956042be2cc4adb0159"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/coresdk/coresdk-09.01.00.001-config.yml b/kas/coresdk/co=
resdk-09.01.00.001-config.yml
> index 8bbecfb..8e8b7a4 100644
> --- a/kas/coresdk/coresdk-09.01.00.001-config.yml
> +++ b/kas/coresdk/coresdk-09.01.00.001-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "9993a89e5b97dda5f3657e5a7cc3a4fa94ff7111"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/coresdk/coresdk-09.01.00.003-config.yml b/kas/coresdk/co=
resdk-09.01.00.003-config.yml
> index 37def6c..0a83da7 100644
> --- a/kas/coresdk/coresdk-09.01.00.003-config.yml
> +++ b/kas/coresdk/coresdk-09.01.00.003-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "6c1ffa9091d0c53a100e8c8c15122d28642034bd"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/coresdk/coresdk-09.01.00.007-config.yml b/kas/coresdk/co=
resdk-09.01.00.007-config.yml
> index 3666271..6075cbb 100644
> --- a/kas/coresdk/coresdk-09.01.00.007-config.yml
> +++ b/kas/coresdk/coresdk-09.01.00.007-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/coresdk/coresdk-09.01.00.008-config.yml b/kas/coresdk/co=
resdk-09.01.00.008-config.yml
> index 4dcae9d..34478a2 100644
> --- a/kas/coresdk/coresdk-09.01.00.008-config.yml
> +++ b/kas/coresdk/coresdk-09.01.00.008-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/coresdk/coresdk-09.02.00.008-config.yml b/kas/coresdk/co=
resdk-09.02.00.008-config.yml
> index 487092c..ded28b8 100644
> --- a/kas/coresdk/coresdk-09.02.00.008-config.yml
> +++ b/kas/coresdk/coresdk-09.02.00.008-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/coresdk/coresdk-09.02.00.009-config.yml b/kas/coresdk/co=
resdk-09.02.00.009-config.yml
> index 2eb8523..64d406a 100644
> --- a/kas/coresdk/coresdk-09.02.00.009-config.yml
> +++ b/kas/coresdk/coresdk-09.02.00.009-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/coresdk/coresdk-09.02.00.010-config.yml b/kas/coresdk/co=
resdk-09.02.00.010-config.yml
> index 277974e..80ad97b 100644
> --- a/kas/coresdk/coresdk-09.02.00.010-config.yml
> +++ b/kas/coresdk/coresdk-09.02.00.010-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/coresdk/coresdk-09.03.05-config.yml b/kas/coresdk/coresd=
k-09.03.05-config.yml
> index b77e5be..c530bfe 100644
> --- a/kas/coresdk/coresdk-09.03.05-config.yml
> +++ b/kas/coresdk/coresdk-09.03.05-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "3f88b005244a0afb5d5c7260e54a94a453ec9b3e"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/coresdk/coresdk-10.00.07-config.yml b/kas/coresdk/coresd=
k-10.00.07-config.yml
> index e35fc26..28f15db 100644
> --- a/kas/coresdk/coresdk-10.00.07-config.yml
> +++ b/kas/coresdk/coresdk-10.00.07-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/coresdk/coresdk-10.01.08-config.yml b/kas/coresdk/coresd=
k-10.01.08-config.yml
> index fea018a..b0b2995 100644
> --- a/kas/coresdk/coresdk-10.01.08-config.yml
> +++ b/kas/coresdk/coresdk-10.01.08-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "377eba2361850adfb8ce7e761ef9c76be287f88c"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/coresdk/coresdk-10.01.10-config.yml b/kas/coresdk/coresd=
k-10.01.10-config.yml
> index 12f688f..39f14eb 100644
> --- a/kas/coresdk/coresdk-10.01.10-config.yml
> +++ b/kas/coresdk/coresdk-10.01.10-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "6c2641f7a9e92c1b82e306f59ddd3c1249c52cbf"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/coresdk/coresdk-10.01.10-selinux-config.yml b/kas/coresd=
k/coresdk-10.01.10-selinux-config.yml
> index c463216..8bc71f6 100644
> --- a/kas/coresdk/coresdk-10.01.10-selinux-config.yml
> +++ b/kas/coresdk/coresdk-10.01.10-selinux-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "6c2641f7a9e92c1b82e306f59ddd3c1249c52cbf"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/coresdk/coresdk-11.00.09-config.yml b/kas/coresdk/coresd=
k-11.00.09-config.yml
> index a41fb0b..c840738 100644
> --- a/kas/coresdk/coresdk-11.00.09-config.yml
> +++ b/kas/coresdk/coresdk-11.00.09-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/coresdk/coresdk-11.00.15-config.yml b/kas/coresdk/coresd=
k-11.00.15-config.yml
> index 893e9c7..55551ea 100644
> --- a/kas/coresdk/coresdk-11.00.15-config.yml
> +++ b/kas/coresdk/coresdk-11.00.15-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/coresdk/coresdk-11.01.05-config.yml b/kas/coresdk/coresd=
k-11.01.05-config.yml
> index 8d44aca..b3c5f8e 100644
> --- a/kas/coresdk/coresdk-11.01.05-config.yml
> +++ b/kas/coresdk/coresdk-11.01.05-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/distroless-kirkstone-config.yml b/kas/distroless-kirksto=
ne-config.yml
> index 1b34980..e7b9781 100644
> --- a/kas/distroless-kirkstone-config.yml
> +++ b/kas/distroless-kirkstone-config.yml
> @@ -7,6 +7,12 @@ header:
>  target:
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    layers:
> +      .: disabled
> +
>    meta-ti:
>      url: "https://git.yoctoproject.org/meta-ti"
>      branch: "kirkstone"
> diff --git a/kas/distroless-master-config.yml b/kas/distroless-master-con=
fig.yml
> index 08f8260..c493d31 100644
> --- a/kas/distroless-master-config.yml
> +++ b/kas/distroless-master-config.yml
> @@ -7,6 +7,12 @@ header:
>  target:
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "master"
> +    layers:
> +      .: disabled
> +
>    meta-ti:
>      url: "https://git.yoctoproject.org/meta-ti"
>      branch: "master"
> diff --git a/kas/distroless-scarthgap-config.yml b/kas/distroless-scarthg=
ap-config.yml
> index e1192df..cda7779 100644
> --- a/kas/distroless-scarthgap-config.yml
> +++ b/kas/distroless-scarthgap-config.yml
> @@ -7,6 +7,12 @@ header:
>  target:
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    layers:
> +      .: disabled
> +
>    meta-ti:
>      url: "https://git.yoctoproject.org/meta-ti"
>      branch: "scarthgap"
> diff --git a/kas/poky-kirkstone-config.yml b/kas/poky-kirkstone-config.ym=
l
> index 5639bec..cec518a 100644
> --- a/kas/poky-kirkstone-config.yml
> +++ b/kas/poky-kirkstone-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: core_image_minimal
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    layers:
> +      .: disabled
> +
>    meta-yocto:
>      url: "https://git.yoctoproject.org/meta-yocto"
>      branch: "kirkstone"
> diff --git a/kas/poky-master-config.yml b/kas/poky-master-config.yml
> index 362d3b6..6c0dec8 100644
> --- a/kas/poky-master-config.yml
> +++ b/kas/poky-master-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: core_image_minimal
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "master"
> +    layers:
> +      .: disabled
> +
>    meta-yocto:
>      url: "https://git.yoctoproject.org/meta-yocto"
>      branch: "master"
> diff --git a/kas/poky-master-wip-config.yml b/kas/poky-master-wip-config.=
yml
> index 2690aee..671b864 100644
> --- a/kas/poky-master-wip-config.yml
> +++ b/kas/poky-master-wip-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: core_image_minimal
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "master"
> +    layers:
> +      .: disabled
> +
>    meta-yocto:
>      url: "https://git.yoctoproject.org/meta-yocto"
>      branch: "master"
> diff --git a/kas/poky-scarthgap-config.yml b/kas/poky-scarthgap-config.ym=
l
> index 0344136..19a24c9 100644
> --- a/kas/poky-scarthgap-config.yml
> +++ b/kas/poky-scarthgap-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: core_image_minimal
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    layers:
> +      .: disabled
> +
>    meta-yocto:
>      url: "https://git.yoctoproject.org/meta-yocto"
>      branch: "scarthgap"
> diff --git a/kas/poky-scarthgap-wip-config.yml b/kas/poky-scarthgap-wip-c=
onfig.yml
> index 91e2bd7..b828c74 100644
> --- a/kas/poky-scarthgap-wip-config.yml
> +++ b/kas/poky-scarthgap-wip-config.yml
> @@ -7,6 +7,12 @@ header:
>  target: core_image_minimal
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    layers:
> +      .: disabled
> +
>    meta-yocto:
>      url: "https://git.yoctoproject.org/meta-yocto"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00=
-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-=
config.yml
> index 4ea5bf6..6666ca0 100644
> --- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config=
.yml
> +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config=
.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01=
-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-=
config.yml
> index de84a33..30b7044 100644
> --- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config=
.yml
> +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config=
.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00=
-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-=
config.yml
> index e6897f1..e706a64 100644
> --- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config=
.yml
> +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config=
.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "42a1c9fe698a03feb34c5bba223c6e6e0350925b"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00=
-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-=
config.yml
> index 5bf3a98..1df0228 100644
> --- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config=
.yml
> +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config=
.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00=
-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-=
config.yml
> index e7482a5..9402478 100644
> --- a/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config=
.yml
> +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config=
.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00=
-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-=
config.yml
> index 0db4a01..528fde9 100644
> --- a/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config=
.yml
> +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config=
.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "f40a3a477d5241b697bf2fb030dd804c1ff5839f"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00=
-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-=
config.yml
> index 5e5c085..ac6ddb9 100644
> --- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config=
.yml
> +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config=
.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07=
.05-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.=
07.05-config.yml
> index 83eb847..c1fec79 100644
> --- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-con=
fig.yml
> +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-con=
fig.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "86e7a58c0e9904c33b1b94dddc3d683c2da22d1a"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-=
11.01.07.05-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytic=
s-selinux-11.01.07.05-config.yml
> index bf89fdd..e7dcfe1 100644
> --- a/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.0=
7.05-config.yml
> +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.0=
7.05-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "86e7a58c0e9904c33b1b94dddc3d683c2da22d1a"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml b/ka=
s/processor-sdk-linux/processor-sdk-gateway-10_00.yml
> index ae82d8b..82526b9 100644
> --- a/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml
> +++ b/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml =
b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml
> index 22f511a..82d65d4 100644
> --- a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml
> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml =
b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml
> index bf1bc60..4cd1b75 100644
> --- a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml
> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml =
b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml
> index ee3d6e6..5898f41 100644
> --- a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml
> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "6c1ffa9091d0c53a100e8c8c15122d28642034bd"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml =
b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml
> index 360138d..aee6c3a 100644
> --- a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml
> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml =
b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml
> index 583eb83..8a13d50 100644
> --- a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml
> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml =
b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml
> index 18505be..4d3ee44 100644
> --- a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml
> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml =
b/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
> index ffb709e..aa137e0 100644
> --- a/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "3f88b005244a0afb5d5c7260e54a94a453ec9b3e"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml =
b/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml
> index 25b230b..52a446d 100644
> --- a/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml
> +++ b/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml =
b/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml
> index e681f58..6c78bdc 100644
> --- a/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml
> +++ b/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml =
b/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml
> index b14e5c6..7968206 100644
> --- a/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml
> +++ b/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "377eba2361850adfb8ce7e761ef9c76be287f88c"
> +    layers:
> +      .: disabled
> +
>    meta-arago:
>      url: "https://git.yoctoproject.org/meta-arago"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.ym=
l b/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml
> index de2a68a..3ee04bf 100644
> --- a/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml
> +++ b/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "41b6684489d0261753344956042be2cc4adb0159"
> +    layers:
> +      .: disabled
> +
>    meta-edgeai:
>      url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk/processor-sdk-09.00.00-config.yml b/kas/pr=
ocessor-sdk/processor-sdk-09.00.00-config.yml
> index b983678..66f0fe4 100644
> --- a/kas/processor-sdk/processor-sdk-09.00.00-config.yml
> +++ b/kas/processor-sdk/processor-sdk-09.00.00-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "0c6f86b60cfba67c20733516957c0a654eb2b44c"
> +    layers:
> +      .: disabled
> +
>    meta-edgeai:
>      url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml b=
/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml
> index 9526ff2..347ba16 100644
> --- a/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml
> +++ b/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
> +    layers:
> +      .: disabled
> +
>    meta-processor-sdk:
>      url: "https://git.ti.com/git/processor-sdk/meta-processor-sdk.git"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk/processor-sdk-09.01.00-config.yml b/kas/pr=
ocessor-sdk/processor-sdk-09.01.00-config.yml
> index 701dbbf..0e9191c 100644
> --- a/kas/processor-sdk/processor-sdk-09.01.00-config.yml
> +++ b/kas/processor-sdk/processor-sdk-09.01.00-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml b=
/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml
> index 246ad24..8440d20 100644
> --- a/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml
> +++ b/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "9993a89e5b97dda5f3657e5a7cc3a4fa94ff7111"
> +    layers:
> +      .: disabled
> +
>    meta-processor-sdk:
>      url: "https://git.ti.com/git/processor-sdk/meta-processor-sdk.git"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml=
 b/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml
> index 0c4aed0..79bddb5 100644
> --- a/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml
> +++ b/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "2c6183594279e2e9d03f11155ad969448869c863"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.ym=
l b/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
> index e3bb5b1..f0f347e 100644
> --- a/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
> +++ b/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "3f88b005244a0afb5d5c7260e54a94a453ec9b3e"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.y=
ml b/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml
> index 5b6477d..53f3256 100644
> --- a/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml
> +++ b/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "f6635b32ab553e812fe7c05998ef05834fccd0f3"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.y=
ml b/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml
> index 87a9524..43bb3cc 100644
> --- a/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml
> +++ b/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config=
.yml b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.yml
> index 7949939..262d16a 100644
> --- a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.yml
> +++ b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config=
.yml b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.yml
> index f15eef8..870ee1c 100644
> --- a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.yml
> +++ b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.=
09-config.yml b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01=
.09-config.yml
> index 5c92a60..fbb6207 100644
> --- a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-conf=
ig.yml
> +++ b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-conf=
ig.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.=
10-config.yml b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01=
.10-config.yml
> index 4503848..aed9179 100644
> --- a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-conf=
ig.yml
> +++ b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-conf=
ig.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.0"
> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
>      branch: "kirkstone"
> diff --git a/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config=
.yml b/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.yml
> index 763f230..7cfd6de 100644
> --- a/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.yml
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config=
.yml b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> index 2dc2f5c..95d90b5 100644
> --- a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "6c2641f7a9e92c1b82e306f59ddd3c1249c52cbf"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config=
.yml b/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
> index 13c09c1..889e273 100644
> --- a/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config=
.yml b/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.yml
> index 4db0c9d..49ccaf9 100644
> --- a/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.yml
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.=
04-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07=
.04-config.yml
> index fe204a9..390c41e 100644
> --- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-conf=
ig.yml
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-conf=
ig.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.=
04-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10=
.04-config.yml
> index 351d9ea..9695648 100644
> --- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-conf=
ig.yml
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-conf=
ig.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "6c2641f7a9e92c1b82e306f59ddd3c1249c52cbf"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.=
04-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09=
.04-config.yml
> index cbbea43..d22fbf7 100644
> --- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-conf=
ig.yml
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-conf=
ig.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.=
03-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05=
.03-config.yml
> index b744ffb..3a99adc 100644
> --- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-conf=
ig.yml
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-conf=
ig.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-=
config.yml b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-co=
nfig.yml
> index 87c55ce..1724b07 100644
> --- a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.=
yml
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.=
yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.0=
4-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.0=
4-config.yml
> index 4c83bcb..1b52ba8 100644
> --- a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-confi=
g.yml
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-confi=
g.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> diff --git a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.0=
3-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.0=
3-config.yml
> index a5cde29..12a5b09 100644
> --- a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-confi=
g.yml
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-confi=
g.yml
> @@ -7,6 +7,13 @@ header:
>  target: tisdk-default-image
>
>  repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
> +    layers:
> +      .: disabled
> +
>    meta-tisdk:
>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
>      branch: "scarthgap"
> --
> 2.50.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16473): https://lists.yoctoproject.org/g/meta-arago/m=
essage/16473
> Mute This Topic: https://lists.yoctoproject.org/mt/114710232/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [jcormier@=
criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>


--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

