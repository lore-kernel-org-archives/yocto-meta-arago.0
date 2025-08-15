Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D83CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 19:49:07 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.20270.1755287343708478729
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 12:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=CNcDjOhC;
 spf=pass (domain: criticallink.com, ip: 209.85.219.178, mailfrom: jcormier@criticallink.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e931cc4c9e4so2330682276.2
        for <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 12:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1755287343; x=1755892143; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Q8PWiyp06Qr91gztHrHDajKl8PBCw+20DZ9ccEij9U=;
        b=CNcDjOhCK8nOVvONnKgYiSMgimMjHazWLbhNNR4IsCYcnf2CSQP+si18xlUyPV1reH
         CBvQWHz1NtlZS+rCh4qujlonnUDcBVIxcTZwXr+rYZggrhxjVD0L8F150GwARrYN2iKY
         wOMK8uidhUSFc0necKw3sRMMuF3NsoJ8atEjFVqak/xwRsJAnVtUddGIkVeShzBEPEng
         oKK/oNjRx522MI5jflzUxwSPUpfz7qwWMq6D0DVKkEXj6ssCM4Hzu/1IKU2FGDBxRYhH
         xGED4OCmiAcS10pV9XWohJGc4Fq7h8LkaGnn4hO6e/jvc6KFn2VBnE+fkhhiThm3H7EZ
         g6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755287343; x=1755892143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Q8PWiyp06Qr91gztHrHDajKl8PBCw+20DZ9ccEij9U=;
        b=faJJaYlwLss8FO0DB85glGcZpa/JwjVHdldzFNqZsAuST++PjeVlcJ7yaIvwcW79Xx
         P8Pyu51JUn3kUljHgXhzb2MBcmEeSHLUdZKDOcKsMrSpGv66IAAD5+rVhJ9LrqIDyfbk
         zeKY0ArKtzhRLSc75owN8JxYIAIW24P3Wjp026PXLPeo1uYfrGL7DHgNj9dXu20iQ/4A
         oVFzdKLTfvqEZbXgx2S1JKGK0am7CnJMkkkoC7vt0YwHxwWDe5Lvs/Bho+NfXcBy7/b0
         5GAEYVxPSGBR948pPjbw4tYuHwGZ4vuWnXl+RtRi5I1dNkLYHznpE+ecOdsBhEVvXiMz
         /awQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgqk/+s5naD7q588A7V/8q6pkYURvBGNDVSVRCFcwsVen4FRmhcGrkzFr4z3dAZDtd8p2yQICA+tGt@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yw7hXxvn6YMVJ+INyH3vuM8BjmJjeQ5kSgInLjYUouo2fG1I7J3
	3kw8Fuvm6mRFFO266QCNcKX9A1qhOxFAW637xcI8qUMxH0poROtd0O8raGV9FV3JS1o8PWr1NqB
	C+3WKD7sUes30vK2xgwVWL5uF6/SbYBmL/wGT7j6x
X-Gm-Gg: ASbGncvYYJDZUucevCuJyGWsIbZ0yFPQgThxV7dX5wS97iCfqjwrz0bT1IsfZxknfhm
	xaPeacseb0ij/Svja1t2t7NFicrL2clBEPBObFZBdgGvmopnSkjwY9wyJ20ri5WT6GXLmBO7pU1
	Ltnm7aueoZtmmTTrw8X3gKGINy+DyOFNokl1GH57HLMpopECW88jiBA6EjczG1chcwhfUdnM0tK
	4KKDg==
X-Google-Smtp-Source: AGHT+IF9GzTY+xCFfWETgKF8BFIKdmpviy5OuEX0jDc/8kI8RUMEAqmx+s2NPqIy5NOu0vsbrf9vRkql7jX/7l5oWkg=
X-Received: by 2002:a05:6902:1026:b0:e93:3853:1981 with SMTP id
 3f1490d57ef6-e9338531bbfmr3556551276.8.1755287342006; Fri, 15 Aug 2025
 12:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250814232955.1559040-1-rs@ti.com> <20250814232955.1559040-3-rs@ti.com>
 <CADL8D3YwWvVtodQehpL9aL_ytqnjOEF26JRw+KPpjFDdFmB5Og@mail.gmail.com> <DC37XD2JXTIN.2JYXTQ0KPHPKB@ti.com>
In-Reply-To: <DC37XD2JXTIN.2JYXTQ0KPHPKB@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Fri, 15 Aug 2025 15:48:48 -0400
X-Gm-Features: Ac12FXw_SF56NyUgvTANbqU-9uwxuDkm19Y6d_O-iKwKQ2OQsSjY8BDnlim0zTg
Message-ID: <CADL8D3aDf=1M1KjeECNV7ovR8DabE3LrkC6vSR3b4nB+Xg1dFA@mail.gmail.com>
Subject: Re: [meta-arago] [oe-layersetup][PATCH 2/2] kas: regenerate all
 configs to include bitbake
To: Randolph Sapp <rs@ti.com>
Cc: reatmon@ti.com, denis@denix.org, a-christidis@ti.com, 
	meta-arago@lists.yoctoproject.org, nm@ti.com
Content-Type: multipart/alternative; boundary="0000000000007fd3af063c6cae02"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 19:49:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16482

--0000000000007fd3af063c6cae02
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 2:38=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:

> On Fri Aug 15, 2025 at 10:25 AM CDT, Jon Cormier wrote:
> > Is there any simple guide on using kas for the TI builds?
> >
> > If I try on ubuntu 24.04, what the kas documentation says, I get a
> > very minimal and unhelpful failure... With seemingly no way to turn on
> > additional logging.  The build directory is empty as well.
>
> Their documentation is enough with this patch. Prior to this patch we
> would not
> clone the bitbake repo, and the first part of the build is running a
> script in
> oe-core that is supposed to interact with bitbake. This generates the
> cryptic
> 'Command "/tmp/tmp_qqetik6/get_bb_env/work/build" failed with error 1'
> error
> message.
>
Makes sense, i should have read the whole patch set before commenting

With kas-container, Is there a way I'm missing to specify MACHINE=3D<>
without modifying local.conf or using "shell"?

Note: The recent flutter config I guess is missing a blank line, so
rerunning the config make generates a git diff ...
$ git diff
diff --git a/kas/arago-scarthgap-flutter-config.yml
b/kas/arago-scarthgap-flutter-config.yml
index d131a8fa5f78..e5f901bf2bb5 100644
--- a/kas/arago-scarthgap-flutter-config.yml
+++ b/kas/arago-scarthgap-flutter-config.yml
@@ -76,3 +76,4 @@ repos:
     branch: "scarthgap"
     layers:
       meta:
+



>
> > $ kas-container build
> > kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
> > 2025-08-15 11:22:38 - INFO     - kas 4.8.2 started
> > 2025-08-15 11:22:38 - WARNING  - Falling back to file-relative
> > addressing of local include "../templates/bblayers.conf.yml"
> > 2025-08-15 11:22:38 - WARNING  - Update your layer to repo-relative
> > addressing to avoid this warning
> > 2025-08-15 11:22:38 - WARNING  - Falling back to file-relative
> > addressing of local include "../templates/local-arago64-v2.conf.yml"
> > 2025-08-15 11:22:38 - WARNING  - Update your layer to repo-relative
> > addressing to avoid this warning
> > 2025-08-15 11:22:38 - WARNING  - 11.00.09.04 is not a full-length hash
> > for repo "meta-tisdk". This will be an error in future versions.
> > 2025-08-15 11:22:38 - WARNING  - 11.00.09 is not a full-length hash
> > for repo "meta-arago". This will be an error in future versions.
> > 2025-08-15 11:22:38 - WARNING  - 11.00.09 is not a full-length hash
> > for repo "meta-ti". This will be an error in future versions.
> > 2025-08-15 11:22:38 - INFO     - Repository meta-tisdk already
> > contains 11.00.09.04 as tag
> > 2025-08-15 11:22:38 - INFO     - Repository meta-arago already
> > contains 11.00.09 as tag
> > 2025-08-15 11:22:38 - INFO     - Repository meta-qt6 already contains
> > 78855ecc613fcd6eff1a5a012cab5e679df329e4 as commit
> > 2025-08-15 11:22:38 - INFO     - Repository meta-virtualization
> > already contains 0c191912421adff2f753e470056a9a525fbce760 as commit
> > 2025-08-15 11:22:38 - INFO     - Repository meta-openembedded already
> > contains edd1a1e284fdcb80cd48d411f235d47f23bc27ae as commit
> > 2025-08-15 11:22:38 - INFO     - Repository meta-ti already contains
> > 11.00.09 as tag
> > 2025-08-15 11:22:38 - INFO     - Repository meta-arm already contains
> > 3cadb81ffaa9f03b92e302843cb22a9cd41df34b as commit
> > 2025-08-15 11:22:38 - INFO     - Repository meta-clang already
> > contains b9ef02282197380ef05edbd0eb852e1934ceb59b as commit
> > 2025-08-15 11:22:38 - INFO     - Repository oe-core already contains
> > 1be6d83466e3a0da4222ba502c2a86c25c835a35 as commit
> > 2025-08-15 11:22:38 - INFO     - Repository meta-tisdk checked out to
> > 11.00.09.04
> > 2025-08-15 11:22:38 - INFO     - Repository meta-arago checked out to
> 11.00.09
> > 2025-08-15 11:22:38 - INFO     - Repository meta-qt6 checked out to
> > 78855ecc613fcd6eff1a5a012cab5e679df329e4
> > 2025-08-15 11:22:38 - INFO     - Repository meta-virtualization
> > checked out to 0c191912421adff2f753e470056a9a525fbce760
> > 2025-08-15 11:22:38 - INFO     - Repository meta-openembedded checked
> > out to edd1a1e284fdcb80cd48d411f235d47f23bc27ae
> > 2025-08-15 11:22:38 - INFO     - Repository meta-ti checked out to
> 11.00.09
> > 2025-08-15 11:22:38 - INFO     - Repository meta-arm checked out to
> > 3cadb81ffaa9f03b92e302843cb22a9cd41df34b
> > 2025-08-15 11:22:38 - INFO     - Repository meta-clang checked out to
> > b9ef02282197380ef05edbd0eb852e1934ceb59b
> > 2025-08-15 11:22:38 - INFO     - Repository oe-core checked out to
> > 1be6d83466e3a0da4222ba502c2a86c25c835a35
> > 2025-08-15 11:22:38 - ERROR    - Command "/tmp/tmp_qqetik6/get_bb_env
> > /work/build" failed with error 1
> >
> >
> > On Thu, Aug 14, 2025 at 7:30=E2=80=AFPM Randolph Sapp via
> > lists.yoctoproject.org <rs=3Dti.com@lists.yoctoproject.org> wrote:
> >>
> >> From: Randolph Sapp <rs@ti.com>
> >>
> >> Regenerate all kas configs to include the bitbake repo definition.
> >>
> >> Signed-off-by: Randolph Sapp <rs@ti.com>
> >> ---
> >>  kas/arago-kirkstone-chromium-config.yml                    | 6 ++++++
> >>  kas/arago-kirkstone-config.yml                             | 6 ++++++
> >>  kas/arago-kirkstone-next-config.yml                        | 6 ++++++
> >>  kas/arago-kirkstone-wip-config.yml                         | 6 ++++++
> >>  kas/arago-master-chromium-config.yml                       | 6 ++++++
> >>  kas/arago-master-config.yml                                | 6 ++++++
> >>  kas/arago-master-next-config.yml                           | 6 ++++++
> >>  kas/arago-master-selinux-config.yml                        | 6 ++++++
> >>  kas/arago-master-wip-config.yml                            | 6 ++++++
> >>  kas/arago-scarthgap-10x-config.yml                         | 6 ++++++
> >>  kas/arago-scarthgap-10x-next-config.yml                    | 6 ++++++
> >>  kas/arago-scarthgap-chromium-config.yml                    | 6 ++++++
> >>  kas/arago-scarthgap-config.yml                             | 6 ++++++
> >>  kas/arago-scarthgap-next-config.yml                        | 6 ++++++
> >>  kas/arago-scarthgap-selinux-config.yml                     | 6 ++++++
> >>  kas/arago-scarthgap-wip-config.yml                         | 6 ++++++
> >>  kas/coresdk/coresdk-09.00.00.006-config.yml                | 7 ++++++=
+
> >>  kas/coresdk/coresdk-09.00.00.007-config.yml                | 7 ++++++=
+
> >>  kas/coresdk/coresdk-09.00.00.011-config.yml                | 7 ++++++=
+
> >>  kas/coresdk/coresdk-09.01.00.001-config.yml                | 7 ++++++=
+
> >>  kas/coresdk/coresdk-09.01.00.003-config.yml                | 7 ++++++=
+
> >>  kas/coresdk/coresdk-09.01.00.007-config.yml                | 7 ++++++=
+
> >>  kas/coresdk/coresdk-09.01.00.008-config.yml                | 7 ++++++=
+
> >>  kas/coresdk/coresdk-09.02.00.008-config.yml                | 7 ++++++=
+
> >>  kas/coresdk/coresdk-09.02.00.009-config.yml                | 7 ++++++=
+
> >>  kas/coresdk/coresdk-09.02.00.010-config.yml                | 7 ++++++=
+
> >>  kas/coresdk/coresdk-09.03.05-config.yml                    | 7 ++++++=
+
> >>  kas/coresdk/coresdk-10.00.07-config.yml                    | 7 ++++++=
+
> >>  kas/coresdk/coresdk-10.01.08-config.yml                    | 7 ++++++=
+
> >>  kas/coresdk/coresdk-10.01.10-config.yml                    | 7 ++++++=
+
> >>  kas/coresdk/coresdk-10.01.10-selinux-config.yml            | 7 ++++++=
+
> >>  kas/coresdk/coresdk-11.00.09-config.yml                    | 7 ++++++=
+
> >>  kas/coresdk/coresdk-11.00.15-config.yml                    | 7 ++++++=
+
> >>  kas/coresdk/coresdk-11.01.05-config.yml                    | 7 ++++++=
+
> >>  kas/distroless-kirkstone-config.yml                        | 6 ++++++
> >>  kas/distroless-master-config.yml                           | 6 ++++++
> >>  kas/distroless-scarthgap-config.yml                        | 6 ++++++
> >>  kas/poky-kirkstone-config.yml                              | 6 ++++++
> >>  kas/poky-master-config.yml                                 | 6 ++++++
> >>  kas/poky-master-wip-config.yml                             | 6 ++++++
> >>  kas/poky-scarthgap-config.yml                              | 6 ++++++
> >>  kas/poky-scarthgap-wip-config.yml                          | 6 ++++++
> >>  .../processor-sdk-analytics-09.00.00-config.yml            | 7 ++++++=
+
> >>  .../processor-sdk-analytics-09.00.01-config.yml            | 7 ++++++=
+
> >>  .../processor-sdk-analytics-09.01.00-config.yml            | 7 ++++++=
+
> >>  .../processor-sdk-analytics-09.02.00-config.yml            | 7 ++++++=
+
> >>  .../processor-sdk-analytics-10.00.00-config.yml            | 7 ++++++=
+
> >>  .../processor-sdk-analytics-10.01.00-config.yml            | 7 ++++++=
+
> >>  .../processor-sdk-analytics-11.00.00-config.yml            | 7 ++++++=
+
> >>  .../processor-sdk-analytics-11.01.07.05-config.yml         | 7 ++++++=
+
> >>  .../processor-sdk-analytics-selinux-11.01.07.05-config.yml | 7 ++++++=
+
> >>  kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml    | 7 ++++++=
+
> >>  .../processor-sdk-linux-09_00_00_06.yml                    | 7 ++++++=
+
> >>  .../processor-sdk-linux-09_00_00_07.yml                    | 7 ++++++=
+
> >>  .../processor-sdk-linux-09_01_00_06.yml                    | 7 ++++++=
+
> >>  .../processor-sdk-linux-09_01_00_07.yml                    | 7 ++++++=
+
> >>  .../processor-sdk-linux-09_02_00_04.yml                    | 7 ++++++=
+
> >>  .../processor-sdk-linux-09_02_00_05.yml                    | 7 ++++++=
+
> >>  .../processor-sdk-linux-09_03_06_05.yml                    | 7 ++++++=
+
> >>  .../processor-sdk-linux-10_00_07_06.yml                    | 7 ++++++=
+
> >>  .../processor-sdk-linux-10_00_08_06.yml                    | 7 ++++++=
+
> >>  .../processor-sdk-linux-10_01_08_01.yml                    | 7 ++++++=
+
> >>  .../processor-sdk-09.00.00-am62xxsip-config.yml            | 7 ++++++=
+
> >>  kas/processor-sdk/processor-sdk-09.00.00-config.yml        | 7 ++++++=
+
> >>  kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml | 7 ++++++=
+
> >>  kas/processor-sdk/processor-sdk-09.01.00-config.yml        | 7 ++++++=
+
> >>  kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml | 7 ++++++=
+
> >>  .../processor-sdk-09.02.00.08-am64x-config.yml             | 7 ++++++=
+
> >>  .../processor-sdk-09.03.05.02-legacy-config.yml            | 7 ++++++=
+
> >>  .../processor-sdk-11.00.05.02-am62lxx-config.yml           | 7 ++++++=
+
> >>  .../processor-sdk-11.00.15.05-am62lxx-config.yml           | 7 ++++++=
+
> >>  .../processor-sdk-kirkstone-09.02.01.09-config.yml         | 7 ++++++=
+
> >>  .../processor-sdk-kirkstone-09.02.01.10-config.yml         | 7 ++++++=
+
> >>  ...processor-sdk-kirkstone-chromium-09.02.01.09-config.yml | 7 ++++++=
+
> >>  ...processor-sdk-kirkstone-chromium-09.02.01.10-config.yml | 7 ++++++=
+
> >>  .../processor-sdk-scarthgap-10.00.07.04-config.yml         | 7 ++++++=
+
> >>  .../processor-sdk-scarthgap-10.01.10.04-config.yml         | 7 ++++++=
+
> >>  .../processor-sdk-scarthgap-11.00.09.04-config.yml         | 7 ++++++=
+
> >>  .../processor-sdk-scarthgap-11.01.05.03-config.yml         | 7 ++++++=
+
> >>  ...processor-sdk-scarthgap-chromium-10.00.07.04-config.yml | 7 ++++++=
+
> >>  ...processor-sdk-scarthgap-chromium-10.01.10.04-config.yml | 7 ++++++=
+
> >>  ...processor-sdk-scarthgap-chromium-11.00.09.04-config.yml | 7 ++++++=
+
> >>  ...processor-sdk-scarthgap-chromium-11.01.05.03-config.yml | 7 ++++++=
+
> >>  .../processor-sdk-scarthgap-nonqt-11.01.05.03-config.yml   | 7 ++++++=
+
> >>  .../processor-sdk-scarthgap-selinux-11.00.09.04-config.yml | 7 ++++++=
+
> >>  .../processor-sdk-scarthgap-selinux-11.01.05.03-config.yml | 7 ++++++=
+
> >>  86 files changed, 578 insertions(+)
> >>
> >> diff --git a/kas/arago-kirkstone-chromium-config.yml
> b/kas/arago-kirkstone-chromium-config.yml
> >> index 3903a5f..5998939 100644
> >> --- a/kas/arago-kirkstone-chromium-config.yml
> >> +++ b/kas/arago-kirkstone-chromium-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git a/kas/arago-kirkstone-config.yml
> b/kas/arago-kirkstone-config.yml
> >> index 15318ae..b568e1e 100644
> >> --- a/kas/arago-kirkstone-config.yml
> >> +++ b/kas/arago-kirkstone-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git a/kas/arago-kirkstone-next-config.yml
> b/kas/arago-kirkstone-next-config.yml
> >> index 079a7da..352d920 100644
> >> --- a/kas/arago-kirkstone-next-config.yml
> >> +++ b/kas/arago-kirkstone-next-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone-next"
> >> diff --git a/kas/arago-kirkstone-wip-config.yml
> b/kas/arago-kirkstone-wip-config.yml
> >> index 1d56afe..e2b3c90 100644
> >> --- a/kas/arago-kirkstone-wip-config.yml
> >> +++ b/kas/arago-kirkstone-wip-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone-wip"
> >> diff --git a/kas/arago-master-chromium-config.yml
> b/kas/arago-master-chromium-config.yml
> >> index 99168f6..f2ba0e8 100644
> >> --- a/kas/arago-master-chromium-config.yml
> >> +++ b/kas/arago-master-chromium-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "master"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "master"
> >> diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
> >> index b7855b8..c3f1696 100644
> >> --- a/kas/arago-master-config.yml
> >> +++ b/kas/arago-master-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "master"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "master"
> >> diff --git a/kas/arago-master-next-config.yml
> b/kas/arago-master-next-config.yml
> >> index a678b03..cd4931d 100644
> >> --- a/kas/arago-master-next-config.yml
> >> +++ b/kas/arago-master-next-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "master"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "master-next"
> >> diff --git a/kas/arago-master-selinux-config.yml
> b/kas/arago-master-selinux-config.yml
> >> index 41070ec..d1d3656 100644
> >> --- a/kas/arago-master-selinux-config.yml
> >> +++ b/kas/arago-master-selinux-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "master"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "master"
> >> diff --git a/kas/arago-master-wip-config.yml
> b/kas/arago-master-wip-config.yml
> >> index f1628d0..1b90f07 100644
> >> --- a/kas/arago-master-wip-config.yml
> >> +++ b/kas/arago-master-wip-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "master"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "master-wip"
> >> diff --git a/kas/arago-scarthgap-10x-config.yml
> b/kas/arago-scarthgap-10x-config.yml
> >> index 8ddd524..747b4a1 100644
> >> --- a/kas/arago-scarthgap-10x-config.yml
> >> +++ b/kas/arago-scarthgap-10x-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git a/kas/arago-scarthgap-10x-next-config.yml
> b/kas/arago-scarthgap-10x-next-config.yml
> >> index 0972ecf..2fd06a3 100644
> >> --- a/kas/arago-scarthgap-10x-next-config.yml
> >> +++ b/kas/arago-scarthgap-10x-next-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap-next"
> >> diff --git a/kas/arago-scarthgap-chromium-config.yml
> b/kas/arago-scarthgap-chromium-config.yml
> >> index 5dec40f..231374c 100644
> >> --- a/kas/arago-scarthgap-chromium-config.yml
> >> +++ b/kas/arago-scarthgap-chromium-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git a/kas/arago-scarthgap-config.yml
> b/kas/arago-scarthgap-config.yml
> >> index ff34372..975023c 100644
> >> --- a/kas/arago-scarthgap-config.yml
> >> +++ b/kas/arago-scarthgap-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git a/kas/arago-scarthgap-next-config.yml
> b/kas/arago-scarthgap-next-config.yml
> >> index 5b1a5fd..0410b72 100644
> >> --- a/kas/arago-scarthgap-next-config.yml
> >> +++ b/kas/arago-scarthgap-next-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap-next"
> >> diff --git a/kas/arago-scarthgap-selinux-config.yml
> b/kas/arago-scarthgap-selinux-config.yml
> >> index e2917f6..4192974 100644
> >> --- a/kas/arago-scarthgap-selinux-config.yml
> >> +++ b/kas/arago-scarthgap-selinux-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git a/kas/arago-scarthgap-wip-config.yml
> b/kas/arago-scarthgap-wip-config.yml
> >> index 0305611..20c4448 100644
> >> --- a/kas/arago-scarthgap-wip-config.yml
> >> +++ b/kas/arago-scarthgap-wip-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap-wip"
> >> diff --git a/kas/coresdk/coresdk-09.00.00.006-config.yml
> b/kas/coresdk/coresdk-09.00.00.006-config.yml
> >> index 35c98ba..9b983cf 100644
> >> --- a/kas/coresdk/coresdk-09.00.00.006-config.yml
> >> +++ b/kas/coresdk/coresdk-09.00.00.006-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git a/kas/coresdk/coresdk-09.00.00.007-config.yml
> b/kas/coresdk/coresdk-09.00.00.007-config.yml
> >> index 266ea75..b42873f 100644
> >> --- a/kas/coresdk/coresdk-09.00.00.007-config.yml
> >> +++ b/kas/coresdk/coresdk-09.00.00.007-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git a/kas/coresdk/coresdk-09.00.00.011-config.yml
> b/kas/coresdk/coresdk-09.00.00.011-config.yml
> >> index 92ce332..9099cbf 100644
> >> --- a/kas/coresdk/coresdk-09.00.00.011-config.yml
> >> +++ b/kas/coresdk/coresdk-09.00.00.011-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "41b6684489d0261753344956042be2cc4adb0159"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git a/kas/coresdk/coresdk-09.01.00.001-config.yml
> b/kas/coresdk/coresdk-09.01.00.001-config.yml
> >> index 8bbecfb..8e8b7a4 100644
> >> --- a/kas/coresdk/coresdk-09.01.00.001-config.yml
> >> +++ b/kas/coresdk/coresdk-09.01.00.001-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "9993a89e5b97dda5f3657e5a7cc3a4fa94ff7111"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git a/kas/coresdk/coresdk-09.01.00.003-config.yml
> b/kas/coresdk/coresdk-09.01.00.003-config.yml
> >> index 37def6c..0a83da7 100644
> >> --- a/kas/coresdk/coresdk-09.01.00.003-config.yml
> >> +++ b/kas/coresdk/coresdk-09.01.00.003-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "6c1ffa9091d0c53a100e8c8c15122d28642034bd"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git a/kas/coresdk/coresdk-09.01.00.007-config.yml
> b/kas/coresdk/coresdk-09.01.00.007-config.yml
> >> index 3666271..6075cbb 100644
> >> --- a/kas/coresdk/coresdk-09.01.00.007-config.yml
> >> +++ b/kas/coresdk/coresdk-09.01.00.007-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git a/kas/coresdk/coresdk-09.01.00.008-config.yml
> b/kas/coresdk/coresdk-09.01.00.008-config.yml
> >> index 4dcae9d..34478a2 100644
> >> --- a/kas/coresdk/coresdk-09.01.00.008-config.yml
> >> +++ b/kas/coresdk/coresdk-09.01.00.008-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git a/kas/coresdk/coresdk-09.02.00.008-config.yml
> b/kas/coresdk/coresdk-09.02.00.008-config.yml
> >> index 487092c..ded28b8 100644
> >> --- a/kas/coresdk/coresdk-09.02.00.008-config.yml
> >> +++ b/kas/coresdk/coresdk-09.02.00.008-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git a/kas/coresdk/coresdk-09.02.00.009-config.yml
> b/kas/coresdk/coresdk-09.02.00.009-config.yml
> >> index 2eb8523..64d406a 100644
> >> --- a/kas/coresdk/coresdk-09.02.00.009-config.yml
> >> +++ b/kas/coresdk/coresdk-09.02.00.009-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git a/kas/coresdk/coresdk-09.02.00.010-config.yml
> b/kas/coresdk/coresdk-09.02.00.010-config.yml
> >> index 277974e..80ad97b 100644
> >> --- a/kas/coresdk/coresdk-09.02.00.010-config.yml
> >> +++ b/kas/coresdk/coresdk-09.02.00.010-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git a/kas/coresdk/coresdk-09.03.05-config.yml
> b/kas/coresdk/coresdk-09.03.05-config.yml
> >> index b77e5be..c530bfe 100644
> >> --- a/kas/coresdk/coresdk-09.03.05-config.yml
> >> +++ b/kas/coresdk/coresdk-09.03.05-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "3f88b005244a0afb5d5c7260e54a94a453ec9b3e"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git a/kas/coresdk/coresdk-10.00.07-config.yml
> b/kas/coresdk/coresdk-10.00.07-config.yml
> >> index e35fc26..28f15db 100644
> >> --- a/kas/coresdk/coresdk-10.00.07-config.yml
> >> +++ b/kas/coresdk/coresdk-10.00.07-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git a/kas/coresdk/coresdk-10.01.08-config.yml
> b/kas/coresdk/coresdk-10.01.08-config.yml
> >> index fea018a..b0b2995 100644
> >> --- a/kas/coresdk/coresdk-10.01.08-config.yml
> >> +++ b/kas/coresdk/coresdk-10.01.08-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "377eba2361850adfb8ce7e761ef9c76be287f88c"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git a/kas/coresdk/coresdk-10.01.10-config.yml
> b/kas/coresdk/coresdk-10.01.10-config.yml
> >> index 12f688f..39f14eb 100644
> >> --- a/kas/coresdk/coresdk-10.01.10-config.yml
> >> +++ b/kas/coresdk/coresdk-10.01.10-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "6c2641f7a9e92c1b82e306f59ddd3c1249c52cbf"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git a/kas/coresdk/coresdk-10.01.10-selinux-config.yml
> b/kas/coresdk/coresdk-10.01.10-selinux-config.yml
> >> index c463216..8bc71f6 100644
> >> --- a/kas/coresdk/coresdk-10.01.10-selinux-config.yml
> >> +++ b/kas/coresdk/coresdk-10.01.10-selinux-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "6c2641f7a9e92c1b82e306f59ddd3c1249c52cbf"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git a/kas/coresdk/coresdk-11.00.09-config.yml
> b/kas/coresdk/coresdk-11.00.09-config.yml
> >> index a41fb0b..c840738 100644
> >> --- a/kas/coresdk/coresdk-11.00.09-config.yml
> >> +++ b/kas/coresdk/coresdk-11.00.09-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git a/kas/coresdk/coresdk-11.00.15-config.yml
> b/kas/coresdk/coresdk-11.00.15-config.yml
> >> index 893e9c7..55551ea 100644
> >> --- a/kas/coresdk/coresdk-11.00.15-config.yml
> >> +++ b/kas/coresdk/coresdk-11.00.15-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git a/kas/coresdk/coresdk-11.01.05-config.yml
> b/kas/coresdk/coresdk-11.01.05-config.yml
> >> index 8d44aca..b3c5f8e 100644
> >> --- a/kas/coresdk/coresdk-11.01.05-config.yml
> >> +++ b/kas/coresdk/coresdk-11.01.05-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git a/kas/distroless-kirkstone-config.yml
> b/kas/distroless-kirkstone-config.yml
> >> index 1b34980..e7b9781 100644
> >> --- a/kas/distroless-kirkstone-config.yml
> >> +++ b/kas/distroless-kirkstone-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target:
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-ti:
> >>      url: "https://git.yoctoproject.org/meta-ti"
> >>      branch: "kirkstone"
> >> diff --git a/kas/distroless-master-config.yml
> b/kas/distroless-master-config.yml
> >> index 08f8260..c493d31 100644
> >> --- a/kas/distroless-master-config.yml
> >> +++ b/kas/distroless-master-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target:
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "master"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-ti:
> >>      url: "https://git.yoctoproject.org/meta-ti"
> >>      branch: "master"
> >> diff --git a/kas/distroless-scarthgap-config.yml
> b/kas/distroless-scarthgap-config.yml
> >> index e1192df..cda7779 100644
> >> --- a/kas/distroless-scarthgap-config.yml
> >> +++ b/kas/distroless-scarthgap-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target:
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-ti:
> >>      url: "https://git.yoctoproject.org/meta-ti"
> >>      branch: "scarthgap"
> >> diff --git a/kas/poky-kirkstone-config.yml
> b/kas/poky-kirkstone-config.yml
> >> index 5639bec..cec518a 100644
> >> --- a/kas/poky-kirkstone-config.yml
> >> +++ b/kas/poky-kirkstone-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: core_image_minimal
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-yocto:
> >>      url: "https://git.yoctoproject.org/meta-yocto"
> >>      branch: "kirkstone"
> >> diff --git a/kas/poky-master-config.yml b/kas/poky-master-config.yml
> >> index 362d3b6..6c0dec8 100644
> >> --- a/kas/poky-master-config.yml
> >> +++ b/kas/poky-master-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: core_image_minimal
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "master"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-yocto:
> >>      url: "https://git.yoctoproject.org/meta-yocto"
> >>      branch: "master"
> >> diff --git a/kas/poky-master-wip-config.yml
> b/kas/poky-master-wip-config.yml
> >> index 2690aee..671b864 100644
> >> --- a/kas/poky-master-wip-config.yml
> >> +++ b/kas/poky-master-wip-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: core_image_minimal
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "master"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-yocto:
> >>      url: "https://git.yoctoproject.org/meta-yocto"
> >>      branch: "master"
> >> diff --git a/kas/poky-scarthgap-config.yml
> b/kas/poky-scarthgap-config.yml
> >> index 0344136..19a24c9 100644
> >> --- a/kas/poky-scarthgap-config.yml
> >> +++ b/kas/poky-scarthgap-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: core_image_minimal
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-yocto:
> >>      url: "https://git.yoctoproject.org/meta-yocto"
> >>      branch: "scarthgap"
> >> diff --git a/kas/poky-scarthgap-wip-config.yml
> b/kas/poky-scarthgap-wip-config.yml
> >> index 91e2bd7..b828c74 100644
> >> --- a/kas/poky-scarthgap-wip-config.yml
> >> +++ b/kas/poky-scarthgap-wip-config.yml
> >> @@ -7,6 +7,12 @@ header:
> >>  target: core_image_minimal
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-yocto:
> >>      url: "https://git.yoctoproject.org/meta-yocto"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.yml
> b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.yml
> >> index 4ea5bf6..6666ca0 100644
> >> ---
> a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.yml
> >> +++
> b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.yml
> b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.yml
> >> index de84a33..30b7044 100644
> >> ---
> a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.yml
> >> +++
> b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.yml
> b/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.yml
> >> index e6897f1..e706a64 100644
> >> ---
> a/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.yml
> >> +++
> b/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "42a1c9fe698a03feb34c5bba223c6e6e0350925b"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.yml
> b/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.yml
> >> index 5bf3a98..1df0228 100644
> >> ---
> a/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.yml
> >> +++
> b/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.yml
> b/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.yml
> >> index e7482a5..9402478 100644
> >> ---
> a/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.yml
> >> +++
> b/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.yml
> b/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.yml
> >> index 0db4a01..528fde9 100644
> >> ---
> a/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.yml
> >> +++
> b/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "f40a3a477d5241b697bf2fb030dd804c1ff5839f"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.yml
> b/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.yml
> >> index 5e5c085..ac6ddb9 100644
> >> ---
> a/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.yml
> >> +++
> b/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.=
yml
> b/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.=
yml
> >> index 83eb847..c1fec79 100644
> >> ---
> a/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.=
yml
> >> +++
> b/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.=
yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "86e7a58c0e9904c33b1b94dddc3d683c2da22d1a"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05=
-config.yml
> b/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05=
-config.yml
> >> index bf89fdd..e7dcfe1 100644
> >> ---
> a/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05=
-config.yml
> >> +++
> b/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05=
-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "86e7a58c0e9904c33b1b94dddc3d683c2da22d1a"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> diff --git a/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml
> b/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml
> >> index ae82d8b..82526b9 100644
> >> --- a/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml
> >> +++ b/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml
> b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml
> >> index 22f511a..82d65d4 100644
> >> --- a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml
> >> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml
> b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml
> >> index bf1bc60..4cd1b75 100644
> >> --- a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml
> >> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml
> b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml
> >> index ee3d6e6..5898f41 100644
> >> --- a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml
> >> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "6c1ffa9091d0c53a100e8c8c15122d28642034bd"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml
> b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml
> >> index 360138d..aee6c3a 100644
> >> --- a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml
> >> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml
> b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml
> >> index 583eb83..8a13d50 100644
> >> --- a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml
> >> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml
> b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml
> >> index 18505be..4d3ee44 100644
> >> --- a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml
> >> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
> b/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
> >> index ffb709e..aa137e0 100644
> >> --- a/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
> >> +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "3f88b005244a0afb5d5c7260e54a94a453ec9b3e"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml
> b/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml
> >> index 25b230b..52a446d 100644
> >> --- a/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml
> >> +++ b/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml
> b/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml
> >> index e681f58..6c78bdc 100644
> >> --- a/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml
> >> +++ b/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml
> b/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml
> >> index b14e5c6..7968206 100644
> >> --- a/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml
> >> +++ b/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "377eba2361850adfb8ce7e761ef9c76be287f88c"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-arago:
> >>      url: "https://git.yoctoproject.org/meta-arago"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml
> b/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml
> >> index de2a68a..3ee04bf 100644
> >> --- a/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "41b6684489d0261753344956042be2cc4adb0159"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-edgeai:
> >>      url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
> >>      branch: "kirkstone"
> >> diff --git a/kas/processor-sdk/processor-sdk-09.00.00-config.yml
> b/kas/processor-sdk/processor-sdk-09.00.00-config.yml
> >> index b983678..66f0fe4 100644
> >> --- a/kas/processor-sdk/processor-sdk-09.00.00-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-09.00.00-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "0c6f86b60cfba67c20733516957c0a654eb2b44c"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-edgeai:
> >>      url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
> >>      branch: "kirkstone"
> >> diff --git a/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.ym=
l
> b/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml
> >> index 9526ff2..347ba16 100644
> >> --- a/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-processor-sdk:
> >>      url: "https://git.ti.com/git/processor-sdk/meta-processor-sdk.git=
"
> >>      branch: "kirkstone"
> >> diff --git a/kas/processor-sdk/processor-sdk-09.01.00-config.yml
> b/kas/processor-sdk/processor-sdk-09.01.00-config.yml
> >> index 701dbbf..0e9191c 100644
> >> --- a/kas/processor-sdk/processor-sdk-09.01.00-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-09.01.00-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
> >>      branch: "kirkstone"
> >> diff --git a/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.ym=
l
> b/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml
> >> index 246ad24..8440d20 100644
> >> --- a/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "9993a89e5b97dda5f3657e5a7cc3a4fa94ff7111"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-processor-sdk:
> >>      url: "https://git.ti.com/git/processor-sdk/meta-processor-sdk.git=
"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml
> b/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml
> >> index 0c4aed0..79bddb5 100644
> >> --- a/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "2c6183594279e2e9d03f11155ad969448869c863"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
> b/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
> >> index e3bb5b1..f0f347e 100644
> >> --- a/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "3f88b005244a0afb5d5c7260e54a94a453ec9b3e"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml
> b/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml
> >> index 5b6477d..53f3256 100644
> >> --- a/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "f6635b32ab553e812fe7c05998ef05834fccd0f3"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml
> b/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml
> >> index 87a9524..43bb3cc 100644
> >> --- a/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.yml
> b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.yml
> >> index 7949939..262d16a 100644
> >> --- a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.yml
> b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.yml
> >> index f15eef8..870ee1c 100644
> >> --- a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.y=
ml
> b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.y=
ml
> >> index 5c92a60..fbb6207 100644
> >> ---
> a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.y=
ml
> >> +++
> b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.y=
ml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.y=
ml
> b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.y=
ml
> >> index 4503848..aed9179 100644
> >> ---
> a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.y=
ml
> >> +++
> b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.y=
ml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.0"
> >> +    commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
> >>      branch: "kirkstone"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.yml
> b/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.yml
> >> index 763f230..7cfd6de 100644
> >> --- a/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> >> index 2dc2f5c..95d90b5 100644
> >> --- a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "6c2641f7a9e92c1b82e306f59ddd3c1249c52cbf"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
> b/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
> >> index 13c09c1..889e273 100644
> >> --- a/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.yml
> b/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.yml
> >> index 4db0c9d..49ccaf9 100644
> >> --- a/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.yml
> >> +++ b/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.y=
ml
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.y=
ml
> >> index fe204a9..390c41e 100644
> >> ---
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.y=
ml
> >> +++
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.y=
ml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> >> index 351d9ea..9695648 100644
> >> ---
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> >> +++
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "6c2641f7a9e92c1b82e306f59ddd3c1249c52cbf"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.y=
ml
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.y=
ml
> >> index cbbea43..d22fbf7 100644
> >> ---
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.y=
ml
> >> +++
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.y=
ml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.y=
ml
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.y=
ml
> >> index b744ffb..3a99adc 100644
> >> ---
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.y=
ml
> >> +++
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.y=
ml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.yml
> b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.yml
> >> index 87c55ce..1724b07 100644
> >> ---
> a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.yml
> >> +++
> b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.yml
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.ym=
l
> b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.ym=
l
> >> index 4c83bcb..1b52ba8 100644
> >> ---
> a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.ym=
l
> >> +++
> b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.ym=
l
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.ym=
l
> b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.ym=
l
> >> index a5cde29..12a5b09 100644
> >> ---
> a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.ym=
l
> >> +++
> b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.ym=
l
> >> @@ -7,6 +7,13 @@ header:
> >>  target: tisdk-default-image
> >>
> >>  repos:
> >> +  bitbake:
> >> +    url: "https://git.openembedded.org/bitbake"
> >> +    branch: "2.8"
> >> +    commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
> >> +    layers:
> >> +      .: disabled
> >> +
> >>    meta-tisdk:
> >>      url: "https://github.com/TexasInstruments/meta-tisdk.git"
> >>      branch: "scarthgap"
> >> --
> >> 2.50.1
> >>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#16473):
> https://lists.yoctoproject.org/g/meta-arago/message/16473
> >> Mute This Topic: https://lists.yoctoproject.org/mt/114710232/7902621
> >> Group Owner: meta-arago+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [
> jcormier@criticallink.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >>
>
>

--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211
<https://twitter.com/Critical_Link>

--0000000000007fd3af063c6cae02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 15,=
 2025 at 2:38=E2=80=AFPM Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com">rs@=
ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Fri Aug 15, 2025 at 10:25 AM CDT, Jon Cormier wrote:<br>
&gt; Is there any simple guide on using kas for the TI builds?<br>
&gt;<br>
&gt; If I try on ubuntu 24.04, what the kas documentation says, I get a<br>
&gt; very minimal and unhelpful failure... With seemingly no way to turn on=
<br>
&gt; additional logging.=C2=A0 The build directory is empty as well.<br>
<br>
Their documentation is enough with this patch. Prior to this patch we would=
 not<br>
clone the bitbake repo, and the first part of the build is running a script=
 in<br>
oe-core that is supposed to interact with bitbake. This generates the crypt=
ic<br>
&#39;Command &quot;/tmp/tmp_qqetik6/get_bb_env/work/build&quot; failed with=
 error 1&#39; error<br>
message.<br></blockquote><div>Makes sense, i should have read the whole pat=
ch set before commenting</div><div><br></div><div>With kas-container, Is th=
ere a way I&#39;m missing to specify MACHINE=3D&lt;&gt; without modifying l=
ocal.conf or using &quot;shell&quot;?</div><div><br></div><div>Note: The re=
cent flutter config I guess is missing a blank line, so rerunning the confi=
g make generates a git diff ...</div><div>$ git diff<br>diff --git a/kas/ar=
ago-scarthgap-flutter-config.yml b/kas/arago-scarthgap-flutter-config.yml<b=
r>index d131a8fa5f78..e5f901bf2bb5 100644<br>--- a/kas/arago-scarthgap-flut=
ter-config.yml<br>+++ b/kas/arago-scarthgap-flutter-config.yml<br>@@ -76,3 =
+76,4 @@ repos:<br>=C2=A0 =C2=A0 =C2=A0branch: &quot;scarthgap&quot;<br>=C2=
=A0 =C2=A0 =C2=A0layers:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0meta:<br>+<br><br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; $ kas-container build<br>
&gt; kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- kas 4.8.2 started<br>
&gt; 2025-08-15 11:22:38 - WARNING=C2=A0 - Falling back to file-relative<br=
>
&gt; addressing of local include &quot;../templates/bblayers.conf.yml&quot;=
<br>
&gt; 2025-08-15 11:22:38 - WARNING=C2=A0 - Update your layer to repo-relati=
ve<br>
&gt; addressing to avoid this warning<br>
&gt; 2025-08-15 11:22:38 - WARNING=C2=A0 - Falling back to file-relative<br=
>
&gt; addressing of local include &quot;../templates/local-arago64-v2.conf.y=
ml&quot;<br>
&gt; 2025-08-15 11:22:38 - WARNING=C2=A0 - Update your layer to repo-relati=
ve<br>
&gt; addressing to avoid this warning<br>
&gt; 2025-08-15 11:22:38 - WARNING=C2=A0 - 11.00.09.04 is not a full-length=
 hash<br>
&gt; for repo &quot;meta-tisdk&quot;. This will be an error in future versi=
ons.<br>
&gt; 2025-08-15 11:22:38 - WARNING=C2=A0 - 11.00.09 is not a full-length ha=
sh<br>
&gt; for repo &quot;meta-arago&quot;. This will be an error in future versi=
ons.<br>
&gt; 2025-08-15 11:22:38 - WARNING=C2=A0 - 11.00.09 is not a full-length ha=
sh<br>
&gt; for repo &quot;meta-ti&quot;. This will be an error in future versions=
.<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-tisdk =
already<br>
&gt; contains 11.00.09.04 as tag<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-arago =
already<br>
&gt; contains 11.00.09 as tag<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-qt6 al=
ready contains<br>
&gt; 78855ecc613fcd6eff1a5a012cab5e679df329e4 as commit<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-virtua=
lization<br>
&gt; already contains 0c191912421adff2f753e470056a9a525fbce760 as commit<br=
>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-openem=
bedded already<br>
&gt; contains edd1a1e284fdcb80cd48d411f235d47f23bc27ae as commit<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-ti alr=
eady contains<br>
&gt; 11.00.09 as tag<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-arm al=
ready contains<br>
&gt; 3cadb81ffaa9f03b92e302843cb22a9cd41df34b as commit<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-clang =
already<br>
&gt; contains b9ef02282197380ef05edbd0eb852e1934ceb59b as commit<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository oe-core alr=
eady contains<br>
&gt; 1be6d83466e3a0da4222ba502c2a86c25c835a35 as commit<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-tisdk =
checked out to<br>
&gt; 11.00.09.04<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-arago =
checked out to 11.00.09<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-qt6 ch=
ecked out to<br>
&gt; 78855ecc613fcd6eff1a5a012cab5e679df329e4<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-virtua=
lization<br>
&gt; checked out to 0c191912421adff2f753e470056a9a525fbce760<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-openem=
bedded checked<br>
&gt; out to edd1a1e284fdcb80cd48d411f235d47f23bc27ae<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-ti che=
cked out to 11.00.09<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-arm ch=
ecked out to<br>
&gt; 3cadb81ffaa9f03b92e302843cb22a9cd41df34b<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository meta-clang =
checked out to<br>
&gt; b9ef02282197380ef05edbd0eb852e1934ceb59b<br>
&gt; 2025-08-15 11:22:38 - INFO=C2=A0 =C2=A0 =C2=A0- Repository oe-core che=
cked out to<br>
&gt; 1be6d83466e3a0da4222ba502c2a86c25c835a35<br>
&gt; 2025-08-15 11:22:38 - ERROR=C2=A0 =C2=A0 - Command &quot;/tmp/tmp_qqet=
ik6/get_bb_env<br>
&gt; /work/build&quot; failed with error 1<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Aug 14, 2025 at 7:30=E2=80=AFPM Randolph Sapp via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D=
"_blank">lists.yoctoproject.org</a> &lt;rs=3D<a href=3D"mailto:ti.com@lists=
.yoctoproject.org" target=3D"_blank">ti.com@lists.yoctoproject.org</a>&gt; =
wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_bl=
ank">rs@ti.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Regenerate all kas configs to include the bitbake repo definition.=
<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" targ=
et=3D"_blank">rs@ti.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 kas/arago-kirkstone-chromium-config.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
&gt;&gt;=C2=A0 kas/arago-kirkstone-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 6 ++++++<br>
&gt;&gt;=C2=A0 kas/arago-kirkstone-next-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
&gt;&gt;=C2=A0 kas/arago-kirkstone-wip-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++++=
+<br>
&gt;&gt;=C2=A0 kas/arago-master-chromium-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ++++++<br>
&gt;&gt;=C2=A0 kas/arago-master-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 6 ++++++<br>
&gt;&gt;=C2=A0 kas/arago-master-next-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ++=
++++<br>
&gt;&gt;=C2=A0 kas/arago-master-selinux-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
&gt;&gt;=C2=A0 kas/arago-master-wip-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +=
+++++<br>
&gt;&gt;=C2=A0 kas/arago-scarthgap-10x-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++++=
+<br>
&gt;&gt;=C2=A0 kas/arago-scarthgap-10x-next-config.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
&gt;&gt;=C2=A0 kas/arago-scarthgap-chromium-config.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
&gt;&gt;=C2=A0 kas/arago-scarthgap-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 6 ++++++<br>
&gt;&gt;=C2=A0 kas/arago-scarthgap-next-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
&gt;&gt;=C2=A0 kas/arago-scarthgap-selinux-config.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ++++++<br>
&gt;&gt;=C2=A0 kas/arago-scarthgap-wip-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++++=
+<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-09.00.00.006-config.yml=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-09.00.00.007-config.yml=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-09.00.00.011-config.yml=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-09.01.00.001-config.yml=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-09.01.00.003-config.yml=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-09.01.00.007-config.yml=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-09.01.00.008-config.yml=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-09.02.00.008-config.yml=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-09.02.00.009-config.yml=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-09.02.00.010-config.yml=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-09.03.05-config.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-10.00.07-config.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-10.01.08-config.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-10.01.10-config.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-10.01.10-selinux-config.yml=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-11.00.09-config.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-11.00.15-config.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/coresdk/coresdk-11.01.05-config.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/distroless-kirkstone-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
&gt;&gt;=C2=A0 kas/distroless-master-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ++=
++++<br>
&gt;&gt;=C2=A0 kas/distroless-scarthgap-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
&gt;&gt;=C2=A0 kas/poky-kirkstone-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 6 ++++++<br>
&gt;&gt;=C2=A0 kas/poky-master-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 6 ++++++<br>
&gt;&gt;=C2=A0 kas/poky-master-wip-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 6 ++++++<br>
&gt;&gt;=C2=A0 kas/poky-scarthgap-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 6 ++++++<br>
&gt;&gt;=C2=A0 kas/poky-scarthgap-wip-config.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ++++++<=
br>
&gt;&gt;=C2=A0 .../processor-sdk-analytics-09.00.00-config.yml=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-analytics-09.00.01-config.yml=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-analytics-09.01.00-config.yml=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-analytics-09.02.00-config.yml=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-analytics-10.00.00-config.yml=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-analytics-10.01.00-config.yml=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-analytics-11.00.00-config.yml=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-analytics-11.01.07.05-config.yml=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-analytics-selinux-11.01.07.05-config.yml |=
 7 +++++++<br>
&gt;&gt;=C2=A0 kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml=C2=
=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-linux-09_00_00_06.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-linux-09_00_00_07.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-linux-09_01_00_06.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-linux-09_01_00_07.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-linux-09_02_00_04.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-linux-09_02_00_05.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-linux-09_03_06_05.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-linux-10_00_07_06.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-linux-10_00_08_06.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-linux-10_01_08_01.yml=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-09.00.00-am62xxsip-config.yml=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/processor-sdk/processor-sdk-09.00.00-config.yml=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml |=
 7 +++++++<br>
&gt;&gt;=C2=A0 kas/processor-sdk/processor-sdk-09.01.00-config.yml=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml |=
 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-09.02.00.08-am64x-config.yml=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-09.03.05.02-legacy-config.yml=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-11.00.05.02-am62lxx-config.yml=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-11.00.15.05-am62lxx-config.yml=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-kirkstone-09.02.01.09-config.yml=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-kirkstone-09.02.01.10-config.yml=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++<br>
&gt;&gt;=C2=A0 ...processor-sdk-kirkstone-chromium-09.02.01.09-config.yml |=
 7 +++++++<br>
&gt;&gt;=C2=A0 ...processor-sdk-kirkstone-chromium-09.02.01.10-config.yml |=
 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-scarthgap-10.00.07.04-config.yml=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-scarthgap-10.01.10.04-config.yml=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-scarthgap-11.00.09.04-config.yml=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-scarthgap-11.01.05.03-config.yml=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++<br>
&gt;&gt;=C2=A0 ...processor-sdk-scarthgap-chromium-10.00.07.04-config.yml |=
 7 +++++++<br>
&gt;&gt;=C2=A0 ...processor-sdk-scarthgap-chromium-10.01.10.04-config.yml |=
 7 +++++++<br>
&gt;&gt;=C2=A0 ...processor-sdk-scarthgap-chromium-11.00.09.04-config.yml |=
 7 +++++++<br>
&gt;&gt;=C2=A0 ...processor-sdk-scarthgap-chromium-11.01.05.03-config.yml |=
 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-scarthgap-nonqt-11.01.05.03-config.yml=C2=
=A0 =C2=A0| 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-scarthgap-selinux-11.00.09.04-config.yml |=
 7 +++++++<br>
&gt;&gt;=C2=A0 .../processor-sdk-scarthgap-selinux-11.01.05.03-config.yml |=
 7 +++++++<br>
&gt;&gt;=C2=A0 86 files changed, 578 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/kas/arago-kirkstone-chromium-config.yml b/kas/arago-k=
irkstone-chromium-config.yml<br>
&gt;&gt; index 3903a5f..5998939 100644<br>
&gt;&gt; --- a/kas/arago-kirkstone-chromium-config.yml<br>
&gt;&gt; +++ b/kas/arago-kirkstone-chromium-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/arago-kirkstone-config.yml b/kas/arago-kirkstone-=
config.yml<br>
&gt;&gt; index 15318ae..b568e1e 100644<br>
&gt;&gt; --- a/kas/arago-kirkstone-config.yml<br>
&gt;&gt; +++ b/kas/arago-kirkstone-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/arago-kirkstone-next-config.yml b/kas/arago-kirks=
tone-next-config.yml<br>
&gt;&gt; index 079a7da..352d920 100644<br>
&gt;&gt; --- a/kas/arago-kirkstone-next-config.yml<br>
&gt;&gt; +++ b/kas/arago-kirkstone-next-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone-next&quot;<br>
&gt;&gt; diff --git a/kas/arago-kirkstone-wip-config.yml b/kas/arago-kirkst=
one-wip-config.yml<br>
&gt;&gt; index 1d56afe..e2b3c90 100644<br>
&gt;&gt; --- a/kas/arago-kirkstone-wip-config.yml<br>
&gt;&gt; +++ b/kas/arago-kirkstone-wip-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone-wip&quot;<br>
&gt;&gt; diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-mast=
er-chromium-config.yml<br>
&gt;&gt; index 99168f6..f2ba0e8 100644<br>
&gt;&gt; --- a/kas/arago-master-chromium-config.yml<br>
&gt;&gt; +++ b/kas/arago-master-chromium-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;master&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;master&quot;<br>
&gt;&gt; diff --git a/kas/arago-master-config.yml b/kas/arago-master-config=
.yml<br>
&gt;&gt; index b7855b8..c3f1696 100644<br>
&gt;&gt; --- a/kas/arago-master-config.yml<br>
&gt;&gt; +++ b/kas/arago-master-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;master&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;master&quot;<br>
&gt;&gt; diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-n=
ext-config.yml<br>
&gt;&gt; index a678b03..cd4931d 100644<br>
&gt;&gt; --- a/kas/arago-master-next-config.yml<br>
&gt;&gt; +++ b/kas/arago-master-next-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;master&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;master-next&quot;<br>
&gt;&gt; diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-maste=
r-selinux-config.yml<br>
&gt;&gt; index 41070ec..d1d3656 100644<br>
&gt;&gt; --- a/kas/arago-master-selinux-config.yml<br>
&gt;&gt; +++ b/kas/arago-master-selinux-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;master&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;master&quot;<br>
&gt;&gt; diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wi=
p-config.yml<br>
&gt;&gt; index f1628d0..1b90f07 100644<br>
&gt;&gt; --- a/kas/arago-master-wip-config.yml<br>
&gt;&gt; +++ b/kas/arago-master-wip-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;master&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;master-wip&quot;<br>
&gt;&gt; diff --git a/kas/arago-scarthgap-10x-config.yml b/kas/arago-scarth=
gap-10x-config.yml<br>
&gt;&gt; index 8ddd524..747b4a1 100644<br>
&gt;&gt; --- a/kas/arago-scarthgap-10x-config.yml<br>
&gt;&gt; +++ b/kas/arago-scarthgap-10x-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/arago-scarthgap-10x-next-config.yml b/kas/arago-s=
carthgap-10x-next-config.yml<br>
&gt;&gt; index 0972ecf..2fd06a3 100644<br>
&gt;&gt; --- a/kas/arago-scarthgap-10x-next-config.yml<br>
&gt;&gt; +++ b/kas/arago-scarthgap-10x-next-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap-next&quot;<br>
&gt;&gt; diff --git a/kas/arago-scarthgap-chromium-config.yml b/kas/arago-s=
carthgap-chromium-config.yml<br>
&gt;&gt; index 5dec40f..231374c 100644<br>
&gt;&gt; --- a/kas/arago-scarthgap-chromium-config.yml<br>
&gt;&gt; +++ b/kas/arago-scarthgap-chromium-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/arago-scarthgap-config.yml b/kas/arago-scarthgap-=
config.yml<br>
&gt;&gt; index ff34372..975023c 100644<br>
&gt;&gt; --- a/kas/arago-scarthgap-config.yml<br>
&gt;&gt; +++ b/kas/arago-scarthgap-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/arago-scarthgap-next-config.yml b/kas/arago-scart=
hgap-next-config.yml<br>
&gt;&gt; index 5b1a5fd..0410b72 100644<br>
&gt;&gt; --- a/kas/arago-scarthgap-next-config.yml<br>
&gt;&gt; +++ b/kas/arago-scarthgap-next-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap-next&quot;<br>
&gt;&gt; diff --git a/kas/arago-scarthgap-selinux-config.yml b/kas/arago-sc=
arthgap-selinux-config.yml<br>
&gt;&gt; index e2917f6..4192974 100644<br>
&gt;&gt; --- a/kas/arago-scarthgap-selinux-config.yml<br>
&gt;&gt; +++ b/kas/arago-scarthgap-selinux-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/arago-scarthgap-wip-config.yml b/kas/arago-scarth=
gap-wip-config.yml<br>
&gt;&gt; index 0305611..20c4448 100644<br>
&gt;&gt; --- a/kas/arago-scarthgap-wip-config.yml<br>
&gt;&gt; +++ b/kas/arago-scarthgap-wip-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap-wip&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-09.00.00.006-config.yml b/kas/cor=
esdk/coresdk-09.00.00.006-config.yml<br>
&gt;&gt; index 35c98ba..9b983cf 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-09.00.00.006-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-09.00.00.006-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;907416ee1062f87f5844ab0638b54616abfc1=
a22&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-09.00.00.007-config.yml b/kas/cor=
esdk/coresdk-09.00.00.007-config.yml<br>
&gt;&gt; index 266ea75..b42873f 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-09.00.00.007-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-09.00.00.007-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;907416ee1062f87f5844ab0638b54616abfc1=
a22&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-09.00.00.011-config.yml b/kas/cor=
esdk/coresdk-09.00.00.011-config.yml<br>
&gt;&gt; index 92ce332..9099cbf 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-09.00.00.011-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-09.00.00.011-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;41b6684489d0261753344956042be2cc4adb0=
159&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-09.01.00.001-config.yml b/kas/cor=
esdk/coresdk-09.01.00.001-config.yml<br>
&gt;&gt; index 8bbecfb..8e8b7a4 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-09.01.00.001-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-09.01.00.001-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;9993a89e5b97dda5f3657e5a7cc3a4fa94ff7=
111&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-09.01.00.003-config.yml b/kas/cor=
esdk/coresdk-09.01.00.003-config.yml<br>
&gt;&gt; index 37def6c..0a83da7 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-09.01.00.003-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-09.01.00.003-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;6c1ffa9091d0c53a100e8c8c15122d2864203=
4bd&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-09.01.00.007-config.yml b/kas/cor=
esdk/coresdk-09.01.00.007-config.yml<br>
&gt;&gt; index 3666271..6075cbb 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-09.01.00.007-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-09.01.00.007-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;a7f6c3e67bd9170e93b2b94676e84018faf0d=
f91&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-09.01.00.008-config.yml b/kas/cor=
esdk/coresdk-09.01.00.008-config.yml<br>
&gt;&gt; index 4dcae9d..34478a2 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-09.01.00.008-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-09.01.00.008-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;a7f6c3e67bd9170e93b2b94676e84018faf0d=
f91&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-09.02.00.008-config.yml b/kas/cor=
esdk/coresdk-09.02.00.008-config.yml<br>
&gt;&gt; index 487092c..ded28b8 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-09.02.00.008-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-09.02.00.008-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;40fd5f4eef7460ca67f32cfce8e229e67e1ff=
607&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-09.02.00.009-config.yml b/kas/cor=
esdk/coresdk-09.02.00.009-config.yml<br>
&gt;&gt; index 2eb8523..64d406a 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-09.02.00.009-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-09.02.00.009-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;40fd5f4eef7460ca67f32cfce8e229e67e1ff=
607&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-09.02.00.010-config.yml b/kas/cor=
esdk/coresdk-09.02.00.010-config.yml<br>
&gt;&gt; index 277974e..80ad97b 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-09.02.00.010-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-09.02.00.010-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;40fd5f4eef7460ca67f32cfce8e229e67e1ff=
607&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-09.03.05-config.yml b/kas/coresdk=
/coresdk-09.03.05-config.yml<br>
&gt;&gt; index b77e5be..c530bfe 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-09.03.05-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-09.03.05-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;3f88b005244a0afb5d5c7260e54a94a453ec9=
b3e&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-10.00.07-config.yml b/kas/coresdk=
/coresdk-10.00.07-config.yml<br>
&gt;&gt; index e35fc26..28f15db 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-10.00.07-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-10.00.07-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;11d83170922a2c6b9db1f6e8c23e533526984=
b2c&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-10.01.08-config.yml b/kas/coresdk=
/coresdk-10.01.08-config.yml<br>
&gt;&gt; index fea018a..b0b2995 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-10.01.08-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-10.01.08-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;377eba2361850adfb8ce7e761ef9c76be287f=
88c&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-10.01.10-config.yml b/kas/coresdk=
/coresdk-10.01.10-config.yml<br>
&gt;&gt; index 12f688f..39f14eb 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-10.01.10-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-10.01.10-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;6c2641f7a9e92c1b82e306f59ddd3c1249c52=
cbf&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-10.01.10-selinux-config.yml b/kas=
/coresdk/coresdk-10.01.10-selinux-config.yml<br>
&gt;&gt; index c463216..8bc71f6 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-10.01.10-selinux-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-10.01.10-selinux-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;6c2641f7a9e92c1b82e306f59ddd3c1249c52=
cbf&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-11.00.09-config.yml b/kas/coresdk=
/coresdk-11.00.09-config.yml<br>
&gt;&gt; index a41fb0b..c840738 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-11.00.09-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-11.00.09-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;696c2c1ef095f8b11c7d2eff36fae50f58c62=
e5e&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-11.00.15-config.yml b/kas/coresdk=
/coresdk-11.00.15-config.yml<br>
&gt;&gt; index 893e9c7..55551ea 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-11.00.15-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-11.00.15-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;696c2c1ef095f8b11c7d2eff36fae50f58c62=
e5e&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/coresdk/coresdk-11.01.05-config.yml b/kas/coresdk=
/coresdk-11.01.05-config.yml<br>
&gt;&gt; index 8d44aca..b3c5f8e 100644<br>
&gt;&gt; --- a/kas/coresdk/coresdk-11.01.05-config.yml<br>
&gt;&gt; +++ b/kas/coresdk/coresdk-11.01.05-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;139f61fe9eec221745184a14b3618d2dfa650=
b91&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/distroless-kirkstone-config.yml b/kas/distroless-=
kirkstone-config.yml<br>
&gt;&gt; index 1b34980..e7b9781 100644<br>
&gt;&gt; --- a/kas/distroless-kirkstone-config.yml<br>
&gt;&gt; +++ b/kas/distroless-kirkstone-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-ti:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-ti" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject=
.org/meta-ti</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/distroless-master-config.yml b/kas/distroless-mas=
ter-config.yml<br>
&gt;&gt; index 08f8260..c493d31 100644<br>
&gt;&gt; --- a/kas/distroless-master-config.yml<br>
&gt;&gt; +++ b/kas/distroless-master-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;master&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-ti:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-ti" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject=
.org/meta-ti</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;master&quot;<br>
&gt;&gt; diff --git a/kas/distroless-scarthgap-config.yml b/kas/distroless-=
scarthgap-config.yml<br>
&gt;&gt; index e1192df..cda7779 100644<br>
&gt;&gt; --- a/kas/distroless-scarthgap-config.yml<br>
&gt;&gt; +++ b/kas/distroless-scarthgap-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-ti:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-ti" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject=
.org/meta-ti</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/poky-kirkstone-config.yml b/kas/poky-kirkstone-co=
nfig.yml<br>
&gt;&gt; index 5639bec..cec518a 100644<br>
&gt;&gt; --- a/kas/poky-kirkstone-config.yml<br>
&gt;&gt; +++ b/kas/poky-kirkstone-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: core_image_minimal<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-yocto:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-yocto" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-yocto</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/poky-master-config.yml b/kas/poky-master-config.y=
ml<br>
&gt;&gt; index 362d3b6..6c0dec8 100644<br>
&gt;&gt; --- a/kas/poky-master-config.yml<br>
&gt;&gt; +++ b/kas/poky-master-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: core_image_minimal<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;master&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-yocto:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-yocto" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-yocto</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;master&quot;<br>
&gt;&gt; diff --git a/kas/poky-master-wip-config.yml b/kas/poky-master-wip-=
config.yml<br>
&gt;&gt; index 2690aee..671b864 100644<br>
&gt;&gt; --- a/kas/poky-master-wip-config.yml<br>
&gt;&gt; +++ b/kas/poky-master-wip-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: core_image_minimal<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;master&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-yocto:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-yocto" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-yocto</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;master&quot;<br>
&gt;&gt; diff --git a/kas/poky-scarthgap-config.yml b/kas/poky-scarthgap-co=
nfig.yml<br>
&gt;&gt; index 0344136..19a24c9 100644<br>
&gt;&gt; --- a/kas/poky-scarthgap-config.yml<br>
&gt;&gt; +++ b/kas/poky-scarthgap-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: core_image_minimal<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-yocto:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-yocto" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-yocto</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/poky-scarthgap-wip-config.yml b/kas/poky-scarthga=
p-wip-config.yml<br>
&gt;&gt; index 91e2bd7..b828c74 100644<br>
&gt;&gt; --- a/kas/poky-scarthgap-wip-config.yml<br>
&gt;&gt; +++ b/kas/poky-scarthgap-wip-config.yml<br>
&gt;&gt; @@ -7,6 +7,12 @@ header:<br>
&gt;&gt;=C2=A0 target: core_image_minimal<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-yocto:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-yocto" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-yocto</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-0=
9.00.00-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09=
.00.00-config.yml<br>
&gt;&gt; index 4ea5bf6..6666ca0 100644<br>
&gt;&gt; --- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00=
-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00=
-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;907416ee1062f87f5844ab0638b54616abfc1=
a22&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-0=
9.00.01-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09=
.00.01-config.yml<br>
&gt;&gt; index de84a33..30b7044 100644<br>
&gt;&gt; --- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01=
-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01=
-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;907416ee1062f87f5844ab0638b54616abfc1=
a22&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-0=
9.01.00-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09=
.01.00-config.yml<br>
&gt;&gt; index e6897f1..e706a64 100644<br>
&gt;&gt; --- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00=
-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00=
-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;42a1c9fe698a03feb34c5bba223c6e6e03509=
25b&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-0=
9.02.00-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09=
.02.00-config.yml<br>
&gt;&gt; index 5bf3a98..1df0228 100644<br>
&gt;&gt; --- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00=
-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00=
-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;40fd5f4eef7460ca67f32cfce8e229e67e1ff=
607&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-1=
0.00.00-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-10=
.00.00-config.yml<br>
&gt;&gt; index e7482a5..9402478 100644<br>
&gt;&gt; --- a/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00=
-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00=
-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;11d83170922a2c6b9db1f6e8c23e533526984=
b2c&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-1=
0.01.00-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-10=
.01.00-config.yml<br>
&gt;&gt; index 0db4a01..528fde9 100644<br>
&gt;&gt; --- a/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00=
-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00=
-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;f40a3a477d5241b697bf2fb030dd804c1ff58=
39f&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-1=
1.00.00-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11=
.00.00-config.yml<br>
&gt;&gt; index 5e5c085..ac6ddb9 100644<br>
&gt;&gt; --- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00=
-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00=
-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;696c2c1ef095f8b11c7d2eff36fae50f58c62=
e5e&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-1=
1.01.07.05-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics=
-11.01.07.05-config.yml<br>
&gt;&gt; index 83eb847..c1fec79 100644<br>
&gt;&gt; --- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07=
.05-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07=
.05-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;86e7a58c0e9904c33b1b94dddc3d683c2da22=
d1a&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-s=
elinux-11.01.07.05-config.yml b/kas/processor-sdk-analytics/processor-sdk-a=
nalytics-selinux-11.01.07.05-config.yml<br>
&gt;&gt; index bf89fdd..e7dcfe1 100644<br>
&gt;&gt; --- a/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-=
11.01.07.05-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-=
11.01.07.05-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;86e7a58c0e9904c33b1b94dddc3d683c2da22=
d1a&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-linux/processor-sdk-gateway-10_00.y=
ml b/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml<br>
&gt;&gt; index ae82d8b..82526b9 100644<br>
&gt;&gt; --- a/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml<br>
&gt;&gt; +++ b/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;11d83170922a2c6b9db1f6e8c23e533526984=
b2c&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_=
06.yml b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml<br>
&gt;&gt; index 22f511a..82d65d4 100644<br>
&gt;&gt; --- a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml<=
br>
&gt;&gt; +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml<=
br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;907416ee1062f87f5844ab0638b54616abfc1=
a22&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_=
07.yml b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml<br>
&gt;&gt; index bf1bc60..4cd1b75 100644<br>
&gt;&gt; --- a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml<=
br>
&gt;&gt; +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml<=
br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;907416ee1062f87f5844ab0638b54616abfc1=
a22&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_=
06.yml b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml<br>
&gt;&gt; index ee3d6e6..5898f41 100644<br>
&gt;&gt; --- a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml<=
br>
&gt;&gt; +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml<=
br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;6c1ffa9091d0c53a100e8c8c15122d2864203=
4bd&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_=
07.yml b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml<br>
&gt;&gt; index 360138d..aee6c3a 100644<br>
&gt;&gt; --- a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml<=
br>
&gt;&gt; +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml<=
br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;a7f6c3e67bd9170e93b2b94676e84018faf0d=
f91&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_=
04.yml b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml<br>
&gt;&gt; index 583eb83..8a13d50 100644<br>
&gt;&gt; --- a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml<=
br>
&gt;&gt; +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml<=
br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;40fd5f4eef7460ca67f32cfce8e229e67e1ff=
607&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_=
05.yml b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml<br>
&gt;&gt; index 18505be..4d3ee44 100644<br>
&gt;&gt; --- a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml<=
br>
&gt;&gt; +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml<=
br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;40fd5f4eef7460ca67f32cfce8e229e67e1ff=
607&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_=
05.yml b/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml<br>
&gt;&gt; index ffb709e..aa137e0 100644<br>
&gt;&gt; --- a/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml<=
br>
&gt;&gt; +++ b/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml<=
br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;3f88b005244a0afb5d5c7260e54a94a453ec9=
b3e&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_=
06.yml b/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml<br>
&gt;&gt; index 25b230b..52a446d 100644<br>
&gt;&gt; --- a/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml<=
br>
&gt;&gt; +++ b/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml<=
br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;11d83170922a2c6b9db1f6e8c23e533526984=
b2c&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_=
06.yml b/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml<br>
&gt;&gt; index e681f58..6c78bdc 100644<br>
&gt;&gt; --- a/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml<=
br>
&gt;&gt; +++ b/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml<=
br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;11d83170922a2c6b9db1f6e8c23e533526984=
b2c&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_=
01.yml b/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml<br>
&gt;&gt; index b14e5c6..7968206 100644<br>
&gt;&gt; --- a/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml<=
br>
&gt;&gt; +++ b/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml<=
br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;377eba2361850adfb8ce7e761ef9c76be287f=
88c&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-arago:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject=
.org/meta-arago" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/meta-arago</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-co=
nfig.yml b/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml<br=
>
&gt;&gt; index de2a68a..3ee04bf 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.ym=
l<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.ym=
l<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;41b6684489d0261753344956042be2cc4adb0=
159&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-edgeai:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.ti.com/git/e=
dgeai/meta-edgeai.git" rel=3D"noreferrer" target=3D"_blank">https://git.ti.=
com/git/edgeai/meta-edgeai.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-09.00.00-config.yml b=
/kas/processor-sdk/processor-sdk-09.00.00-config.yml<br>
&gt;&gt; index b983678..66f0fe4 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-09.00.00-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-09.00.00-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;0c6f86b60cfba67c20733516957c0a654eb2b=
44c&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-edgeai:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.ti.com/git/e=
dgeai/meta-edgeai.git" rel=3D"noreferrer" target=3D"_blank">https://git.ti.=
com/git/edgeai/meta-edgeai.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-09.01.00-am65xx-confi=
g.yml b/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml<br>
&gt;&gt; index 9526ff2..347ba16 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml<b=
r>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml<b=
r>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;a7f6c3e67bd9170e93b2b94676e84018faf0d=
f91&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-processor-sdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.ti.com/git/p=
rocessor-sdk/meta-processor-sdk.git" rel=3D"noreferrer" target=3D"_blank">h=
ttps://git.ti.com/git/processor-sdk/meta-processor-sdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-09.01.00-config.yml b=
/kas/processor-sdk/processor-sdk-09.01.00-config.yml<br>
&gt;&gt; index 701dbbf..0e9191c 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-09.01.00-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-09.01.00-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;a7f6c3e67bd9170e93b2b94676e84018faf0d=
f91&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.ti.com/git/t=
i-sdk-linux/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.ti.com/git/ti-sdk-linux/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-09.01.00-legacy-confi=
g.yml b/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml<br>
&gt;&gt; index 246ad24..8440d20 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml<b=
r>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml<b=
r>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;9993a89e5b97dda5f3657e5a7cc3a4fa94ff7=
111&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-processor-sdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.ti.com/git/p=
rocessor-sdk/meta-processor-sdk.git" rel=3D"noreferrer" target=3D"_blank">h=
ttps://git.ti.com/git/processor-sdk/meta-processor-sdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-con=
fig.yml b/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml<br>
&gt;&gt; index 0c4aed0..79bddb5 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml=
<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml=
<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;2c6183594279e2e9d03f11155ad969448869c=
863&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.ti.com/git/t=
i-sdk-linux/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.ti.com/git/ti-sdk-linux/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-co=
nfig.yml b/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml<br=
>
&gt;&gt; index e3bb5b1..f0f347e 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.ym=
l<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.ym=
l<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;3f88b005244a0afb5d5c7260e54a94a453ec9=
b3e&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-c=
onfig.yml b/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml<=
br>
&gt;&gt; index 5b6477d..53f3256 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.y=
ml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.y=
ml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;f6635b32ab553e812fe7c05998ef05834fccd=
0f3&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-c=
onfig.yml b/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml<=
br>
&gt;&gt; index 87a9524..43bb3cc 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.y=
ml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.y=
ml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;696c2c1ef095f8b11c7d2eff36fae50f58c62=
e5e&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09=
-config.yml b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.=
yml<br>
&gt;&gt; index 7949939..262d16a 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config=
.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config=
.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;40fd5f4eef7460ca67f32cfce8e229e67e1ff=
607&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.ti.com/git/t=
i-sdk-linux/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.ti.com/git/ti-sdk-linux/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10=
-config.yml b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.=
yml<br>
&gt;&gt; index f15eef8..870ee1c 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config=
.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config=
.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;40fd5f4eef7460ca67f32cfce8e229e67e1ff=
607&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.ti.com/git/t=
i-sdk-linux/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.ti.com/git/ti-sdk-linux/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09=
.02.01.09-config.yml b/kas/processor-sdk/processor-sdk-kirkstone-chromium-0=
9.02.01.09-config.yml<br>
&gt;&gt; index 5c92a60..fbb6207 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.=
09-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.=
09-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;40fd5f4eef7460ca67f32cfce8e229e67e1ff=
607&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.ti.com/git/t=
i-sdk-linux/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.ti.com/git/ti-sdk-linux/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09=
.02.01.10-config.yml b/kas/processor-sdk/processor-sdk-kirkstone-chromium-0=
9.02.01.10-config.yml<br>
&gt;&gt; index 4503848..aed9179 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.=
10-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.=
10-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.0&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;40fd5f4eef7460ca67f32cfce8e229e67e1ff=
607&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.ti.com/git/t=
i-sdk-linux/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.ti.com/git/ti-sdk-linux/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;kirkstone&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04=
-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.=
yml<br>
&gt;&gt; index 763f230..7cfd6de 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config=
.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config=
.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;11d83170922a2c6b9db1f6e8c23e533526984=
b2c&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04=
-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.=
yml<br>
&gt;&gt; index 2dc2f5c..95d90b5 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config=
.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config=
.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;6c2641f7a9e92c1b82e306f59ddd3c1249c52=
cbf&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04=
-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.=
yml<br>
&gt;&gt; index 13c09c1..889e273 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config=
.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config=
.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;696c2c1ef095f8b11c7d2eff36fae50f58c62=
e5e&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03=
-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.=
yml<br>
&gt;&gt; index 4db0c9d..49ccaf9 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config=
.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config=
.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;139f61fe9eec221745184a14b3618d2dfa650=
b91&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10=
.00.07.04-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-1=
0.00.07.04-config.yml<br>
&gt;&gt; index fe204a9..390c41e 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.=
04-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.=
04-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;11d83170922a2c6b9db1f6e8c23e533526984=
b2c&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10=
.01.10.04-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-1=
0.01.10.04-config.yml<br>
&gt;&gt; index 351d9ea..9695648 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.=
04-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.=
04-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;6c2641f7a9e92c1b82e306f59ddd3c1249c52=
cbf&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11=
.00.09.04-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-1=
1.00.09.04-config.yml<br>
&gt;&gt; index cbbea43..d22fbf7 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.=
04-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.=
04-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;696c2c1ef095f8b11c7d2eff36fae50f58c62=
e5e&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11=
.01.05.03-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-1=
1.01.05.03-config.yml<br>
&gt;&gt; index b744ffb..3a99adc 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.=
03-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.=
03-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;139f61fe9eec221745184a14b3618d2dfa650=
b91&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01=
.05.03-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.0=
5.03-config.yml<br>
&gt;&gt; index 87c55ce..1724b07 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-=
config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-=
config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;139f61fe9eec221745184a14b3618d2dfa650=
b91&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.=
00.09.04-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.=
00.09.04-config.yml<br>
&gt;&gt; index 4c83bcb..1b52ba8 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.0=
4-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.0=
4-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;696c2c1ef095f8b11c7d2eff36fae50f58c62=
e5e&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; diff --git a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.=
01.05.03-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.=
01.05.03-config.yml<br>
&gt;&gt; index a5cde29..12a5b09 100644<br>
&gt;&gt; --- a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.0=
3-config.yml<br>
&gt;&gt; +++ b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.0=
3-config.yml<br>
&gt;&gt; @@ -7,6 +7,13 @@ header:<br>
&gt;&gt;=C2=A0 target: tisdk-default-image<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 repos:<br>
&gt;&gt; +=C2=A0 bitbake:<br>
&gt;&gt; +=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/=
bitbake</a>&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 branch: &quot;2.8&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 commit: &quot;139f61fe9eec221745184a14b3618d2dfa650=
b91&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 layers:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 .: disabled<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 meta-tisdk:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/Texas=
Instruments/meta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/TexasInstruments/meta-tisdk.git</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.50.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#16473): <a href=3D"https://lists.yoctoproject.=
org/g/meta-arago/message/16473" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.yoctoproject.org/g/meta-arago/message/16473</a><br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/1147=
10232/7902621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/mt/114710232/7902621</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:meta-arago%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-arago+owner@lists.yoctoproject.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arag=
o/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-arago/unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" targ=
et=3D"_blank">jcormier@criticallink.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D=
"ltr"><div><div dir=3D"ltr"><div>Jonathan Cormier<br>Senior Software Engine=
er<div><div><div><div><br></div><div><div><font color=3D"#000000">Voice:=C2=
=A0=C2=A0<a value=3D"+13154254045">315.425.4045</a>=C2=A0x222</font></div><=
div><div><div style=3D"color:rgb(32,33,36)"><div><div><img src=3D"https://c=
i3.googleusercontent.com/mail-sig/AIorK4yQnmPDndAobohgnFohw9o8lcMLmEVCOkbl-=
k9wp4xfgM_Qz53XJlRK_dxYVNdYFLq8DCe6bY4Zl_a0"><br></div><div><div><a href=3D=
"http://www.criticallink.com/" target=3D"_blank">http://www.CriticalLink.co=
m</a></div></div></div><div>6712 Brooklawn Parkway,=C2=A0Syracuse, NY 13211=
 <font color=3D"#1155cc"><font color=3D"#1155cc"><a href=3D"https://twitter=
.com/Critical_Link" target=3D"_blank"><img alt=3D"" src=3D"https://docs.goo=
gle.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1yWERrLXE0SnM&amp;revi=
d=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ"></a></font></font>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div>

--0000000000007fd3af063c6cae02--

