Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D62C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 17:23:23 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.14069.1753809796844043373
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 10:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=ZF+YRuHE;
 spf=pass (domain: criticallink.com, ip: 209.85.219.179, mailfrom: jcormier@criticallink.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e8e21bbd736so1638835276.3
        for <meta-arago@lists.yoctoproject.org>; Tue, 29 Jul 2025 10:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1753809796; x=1754414596; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9MTHQjuQWbS+fYirssIB5IzTz+CAuMj7YvpTPaOf38=;
        b=ZF+YRuHEB0Dpup8ZecQR2gjs08/ticPOy5OHSg2O+Xmv9e3bU8hfarbDgZsrHvlnNg
         843gq39JNN+WcFz8esAzrRtTtSqVkNKZdcubZlFEasO+hDch51bFYQK9CSYfoEt9hTBc
         ByLhiuVQpMA7vVG6GOpSCUDLY3C1uEvnAEo+2yenptSwztFNcy+6BlFaMBYIY43zpzQl
         WCPONyYZkJWpU1Jo7HvEJxHYbZGW9hnUF+KsQ3o8wt2kWKyXDXDq4v78m5op30MDB5E+
         O6LkJr7xodpLpkfj5w95tkVZ5/b9CXVGTu1XA4j+21tZVJdEExvHugK+LDQ2PLFMxOcc
         4NVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753809796; x=1754414596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9MTHQjuQWbS+fYirssIB5IzTz+CAuMj7YvpTPaOf38=;
        b=kWecKutU44BIefcMjvztiiDUfLmDbUyt+cQ3cfc83vDnrSlE89gdGj41bxT1cuH64b
         5zdnJmCeufIjG7iP3D4RX1fxGshYBppuzh6fAeRp/rx7Ulf/5gVdIb+C5gSioHaqj6/a
         RUJbIaCSplRFrPEk3J81afLhnqORjnsPpwjlQS2guQKJQLvDzzE/qaQambytDeuGvoA6
         1Ow0dAmsVFYjzmGfrhqaaUoNJtoVgjCNoY5axFBKIdiIczEiG+P0VLQvq9U+kb0Qwj1Q
         mU5DQSsthfgJyM4Oz8DZ/2jE8ctUSwkC0xKjuuq+k89q0R25LvfbJRTSrKcAKUiCY0mV
         0Nuw==
X-Forwarded-Encrypted: i=1; AJvYcCVEw0K3CAA0n19w4SognzkNB9afWcWrzOnML7knto3nHHDl6eLUP4Lf4DIetKambwxPx8ZmrnZma/i9@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxfijUcU/C7G9UGguzE6+le8m6wf+WQ0pMOW3D+58+cfGUt4IIW
	gtNK8AG3hLo0CpkOzgTiQZaFV9SfSK/Wj/zCYrMKMTQhOpEMGgij9qu3hNfKdS/ex60uPAfsPSo
	Dz1Mn9L2e0mtsrSqa4dDqUQU4EFwHBjrqx/eQzkCK
X-Gm-Gg: ASbGncvN8QlHVAxebCV6bJlCmOMgqgQuOU4FrwcUdcB1G5pORZC7fWdaKQAe+/AJpAF
	yAmqhEcdMJrIUCBmmAGdO9DSbpWnNx6+84gr7Nu2natoWq5dprXVGGuPl3j5tjGJpF4s4GP0tJd
	c4Ez0FLPa+rTutXqsRwM3FpffrMolFN2AwhvdTK14bd1PCsR3FKq4JEhAmx3to56rjAP8xU4ZxT
	uFwPQ==
X-Google-Smtp-Source: AGHT+IGOTBY0aNUeR9HejGyjhZlk7EpI1vL1j0Wp8oj8xrKBHBMWwmbtm7k7D0dS1uKHqbqsmWmE4IaF9m25xk1VZa4=
X-Received: by 2002:a05:6902:2702:b0:e8b:bac6:e1be with SMTP id
 3f1490d57ef6-e8e31512ea3mr627920276.22.1753809795870; Tue, 29 Jul 2025
 10:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250728183922.580652-1-afd@ti.com> <20250728183922.580652-2-afd@ti.com>
In-Reply-To: <20250728183922.580652-2-afd@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 29 Jul 2025 13:23:04 -0400
X-Gm-Features: Ac12FXwniPdxr_Q0WP4vb5H_zKk_qrQOWEl58upZ62tXEyqC1n0Z_06u4uk3z9w
Message-ID: <CADL8D3ahwrwmPe9JaPtEj2j_gz-4-nuKAf3Gjvg3CNp3GewqcA@mail.gmail.com>
Subject: Re: [meta-arago][scarthgap/master][PATCH 2/2] packagegroup-arago-tisdk-amsdk-sdk-host:
 Remove this recipe
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>, 
	meta-arago@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Jul 2025 17:23:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16336

On Mon, Jul 28, 2025 at 2:39=E2=80=AFPM Andrew Davis via
lists.yoctoproject.org <afd=3Dti.com@lists.yoctoproject.org> wrote:
>
> This recipe only now exists to add "tisdk-uenv" to tisdk-core-bundle
> images so uEnv.txt can be packaged into prebuilt-images. We only need
> to package the uEnv.txt as a "prebuilt-image" if some bundled image
> includes it, no need to manually add this for all images.
Does this mean the tisdk-base/default images will no longer include
the example empty uEnv.txt file?
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../recipes-core/images/tisdk-core-bundle.inc    |  4 ----
>  .../packagegroup-arago-tisdk-amsdk-sdk-host.bb   | 16 ----------------
>  2 files changed, 20 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-amsdk-sdk-host.bb
>
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc =
b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> index 43b1ef5f..5f72e7b0 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> +++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
> @@ -33,7 +33,3 @@ TARGET_IMAGES =3D "tisdk-base-image tisdk-default-image=
 tisdk-thinlinux-image tisd
>
>  TISDK_TOOLCHAIN =3D "meta-toolchain-arago-tisdk"
>  TOOLCHAIN_SUFFIX =3D "-tisdk"
> -
> -IMAGE_INSTALL =3D "\
> -    packagegroup-arago-tisdk-amsdk-sdk-host \
> -"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/=
packagegroup-arago-tisdk-amsdk-sdk-host.bb
> deleted file mode 100644
> index 9562310f..00000000
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk-sdk-host.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY =3D "Task to install additional scripts and applications into th=
e SDK"
> -LICENSE =3D "MIT"
> -PR =3D "r30"
> -
> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> -
> -inherit packagegroup
> -
> -EXTRA_FILES =3D ""
> -EXTRA_FILES:ti43x =3D "tisdk-uenv"
> -EXTRA_FILES:omap-a15 =3D "tisdk-uenv"
> -EXTRA_FILES:k3 =3D "tisdk-uenv"
> -
> -RDEPENDS:${PN} =3D "\
> -    ${EXTRA_FILES} \
> -"
> --
> 2.39.2
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16334): https://lists.yoctoproject.org/g/meta-arago/m=
essage/16334
> Mute This Topic: https://lists.yoctoproject.org/mt/114418842/7902621
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

