Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AB2CD8CB2
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 17:51:47 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1724.1781027502240492468
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 10:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=gQ0c/tlR;
 spf=pass (domain: criticallink.com, ip: 209.85.208.42, mailfrom: jcormier@criticallink.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68c1630159bso6626466a12.2
        for <meta-arago@lists.yoctoproject.org>; Tue, 09 Jun 2026 10:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781027500; cv=none;
        d=google.com; s=arc-20240605;
        b=VNh8wlIe2T85LPS175k7dolluInqtIVID1UDVWDFehNdwiRVN2ieNf9KD/ZnzkY0QQ
         0H0aXTGczJE0Y2Yi4tWmKfKHj/TGdSNJnKcgM8lHmYSftiw9jqU8QH4bnLt6yzUzbUc9
         C4w23RlLUnXivT31hcOvPNNaSFFWtwCw1fg7ziQJ6v8eSA+FxDryfY0SmXA3Hn2hRCWS
         plFEbv+iyKv4SFYGMb13LJC83wG7vX0PUPuQKVyzy29Oqm7zD6P3avlkGknr8p7xB8Dc
         eUuhXdaMrCMReVme2PnIC4gJilAiOSM72eGO1IzULdovpuk5I67X+qyIC2t0EBGshJRX
         StbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HW3qTlU3pwek84zuwZNAZ7Pk7hAREalXbuDgWjB1q0A=;
        fh=x1mQsUnNvTDEjra2OAuHROAJqNSuNH/OczX0Aa/WUK0=;
        b=cqcvEoIxHR6EQBYqMmEmu+qZZeyCZoMHH71K/yKevkbRz7dwFTRh5v5G5YFTSgIsqP
         bj11QH88++Zrqr+2A2ieMTL9sm1Uwj8u2nh9gC0UmbXIeyojwB0cKm5h42vNooOhk+Bs
         EpxpXhgxrFKjrYXjg5pnzbYvO4glSfoPU/ZFqjkMtKeTkTEGPMyuzpTkqlXPVU9mYooE
         LFV/ibeZMGzF56V1Il1oplSz4D1DZcf9ssXt0YVIScDuUAW3/F9KW5495GDBWQVKfs0y
         C3O3ik+XmUwHlaGLbRSNRNFzflBl2Dhl7EZFqFwiJ5a4MiQUdiZUgicKogKtrvUNkwfL
         ADBA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1781027500; x=1781632300; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HW3qTlU3pwek84zuwZNAZ7Pk7hAREalXbuDgWjB1q0A=;
        b=gQ0c/tlR2abm/LJHx4hZj/b8QHsqnDcYaO2RIlYf/ITVDwzjyMqusrrD21nHrG6zLX
         PcKvKTC221GrWLeeN2YoN1vWn5+vNtbTB61hHkLdtUVkNGft5oDZySu9KZBwR/StrN7B
         EH4SN299VCNDfe7E4aRAJTj9xAyeHubH32JI4apfMraW1oVBVGV1peQX6PHDuVOYvvpl
         nzMWT4sL8svJnW9e6s+I8aDjGNbh/xqgR03vLbn/mr7GXPHKu2Na3C/moOU0kkQZwJX3
         J2lWczotIiPqGtoNmQgMJdQCpOqaXUUlrMhPUBZLflKJYvaTKudUvPdIJXjNh21vwxu0
         XYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781027500; x=1781632300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HW3qTlU3pwek84zuwZNAZ7Pk7hAREalXbuDgWjB1q0A=;
        b=KjPVM5nX+JHSTy095nA0PjgAqe/TB0EENpx/YiVBsx6jucehy3cH+f2hPbIKmLWaFW
         dipf965tINv6OfHQpIG0Rt0r4kwWwrJIr3YBZpvZAj496nLN+fnEOKvg1ynx9cekuoRT
         abDNnVKUvKwIG7qjfDLlDj7qgrXtcxvaMM/0wcKysANTYEM7nyU/9o9egZ+XvYZkK87c
         5f+Cr4KEdmlImfVNMg4iCHsn5WwNKqagZP6QPOdNg7A0P2afQ++Wb4tsLW2A2/xAfhJb
         P7vweHVsD8VnIeb6uc2L1K3/RNptBVYRzFq1kaYYdUJkC7YP/KsgrUvka9jYoJ2Fbw42
         uG6g==
X-Forwarded-Encrypted: i=1; AFNElJ9u8VuWzFIZH4FG/yg7NswrB3rzdRROr2kBtaL51nNiOOgguqj7buL+TsbBD0K0zSqqifoGYWAiBdAI@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxmAsdRMEvliBUhGkpvFhdYP5sJVPNoiJmd/x7qmKhZ3BT89LfM
	hsz1H0BDWfo6QAQZ2U8Xbov133FxsGtxBUuc7Gl5qGZaT1k6a94aC6ieXayGF95NJuhdVLAGr55
	yBctBHKRGHAdnCjUfAZUuybyRJhil2v0rzBEDkRSm
X-Gm-Gg: Acq92OElYJ57YO+XnSY2vZbTkVW4eJ4QwVm3CPiJpWmShZ6CgfxN2d1M5l0bjvJ0rh1
	9lEbgZuildyiWAUIGfOWEQ1CaJw0nq9re7MO4Jg5hlDM6eZ0PyCGQ0ZCdt1XjwoIU2ofnFmotjO
	8aV1ROZGVkyN1eSkRQ/Hb1H+cvBijbwfJzy9duMSXXMS7j3Ci9F844SbWdlA1xqjiGR/ilCdJzo
	PF82zpEhilU/2+ykcIWTgUG477OJWc4nY4lf6GR7lpUe7m+C6UrcFcZHFgzrVARlX/F/Ajq2XC+
	gcTWQBY/2Iq7oya9
X-Received: by 2002:a05:6402:1598:b0:691:b5aa:5a66 with SMTP id
 4fb4d7f45d1cf-691b5aa5ea2mr5020337a12.16.1781027500348; Tue, 09 Jun 2026
 10:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260609171306.238854-1-t-lannynd@ti.com> <20260609174255.GH23325@denix.org>
In-Reply-To: <20260609174255.GH23325@denix.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 9 Jun 2026 13:51:27 -0400
X-Gm-Features: AVVi8Ce2YQMk_85sBtOR7D6uiIXdvaLiM-OO-8-zKQq9DQYuPI6Uw868ujIgwZQ
Message-ID: <CADL8D3Y-7wywm0qb+T=mdbRm=+tN8rzJQ3-uffnjXvdo2pZ8Fg@mail.gmail.com>
Subject: Re: [meta-arago][master/wrynose][PATCH v2] meta-arago-distro:
 chromium: add force-h264-youtube extension
To: denis@denix.org
Cc: t-lannynd@ti.com, meta-arago@lists.yoctoproject.org, reatmon@ti.com, 
	detheridge@ti.com, b-brnich@ti.com, a-christidis@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Jun 2026 17:51:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17561

On Tue, Jun 9, 2026 at 1:43=E2=80=AFPM Denys Dmytriyenko via
lists.yoctoproject.org <denis=3Ddenix.org@lists.yoctoproject.org> wrote:
>
> On Tue, Jun 09, 2026 at 12:13:06PM -0500, Thorsten Lannynd via lists.yoct=
oproject.org wrote:
> > Install a lightweight Chrome extension that forces YouTube to serve
> > H.264 (avc1) by blocking VP8, VP9, and AV1 via MediaSource.isTypeSuppor=
ted.
> > This enables Wave5 hardware video decoding on YouTube, which only suppo=
rts
> > H.264 and HEVC.
> >
> > Installed at /usr/lib/chromium/extensions/force-h264-youtube
> > and --load-extension flag is needed to enable the extension.
> >
> > Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> > ---
> > v2:
> > - Remove the flag that enables extension by default as not all SoCs sup=
port
> >   Wave5 and Chromium
Why would disabling this extension help? Does this mean there are some
SoCs which do support VP8, VP9, and AV1?  Or if using CPU, decode
those better than h.264?
>
> This is also fine, though requires enabling it manually...

>
>
>
> >  .../chromium/chromium-ozone-wayland-arago.inc | 13 +++++++++++++
> >  .../force-h264-youtube/force_h264.js          |  4 ++++
> >  .../force-h264-youtube/manifest.json          | 19 +++++++++++++++++++
> >  3 files changed, 36 insertions(+)
> >  create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-l=
ayer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/for=
ce_h264.js
> >  create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-l=
ayer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/man=
ifest.json
> >
> > diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro=
/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-oz=
one-wayland-arago.inc
> > index ab092fa1..d8eb0204 100644
> > --- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland-arago.inc
> > +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland-arago.inc
> > @@ -1,5 +1,7 @@
> >  PR:append =3D ".arago0"
> >
> > +EXTENSION_DIR =3D "/usr/lib/chromium/extensions/force-h264-youtube"
> > +
> >  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/chromium-ozone-wayland:"
> >
> >  PACKAGECONFIG:append =3D " proprietary-codecs"
> > @@ -9,4 +11,15 @@ SRC_URI:append =3D " \
> >                    file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-a=
ccess-to-V4L.patch \
> >                    file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-strea=
ming-in-V4L2.patch \
> >                    file://0004-media-gpu-v4l2-Avoid-placing-incomplete-=
H264-access-.patch \
> > +                  file://force-h264-youtube/force_h264.js \
> > +                  file://force-h264-youtube/manifest.json \
> >                    "
> > +
> > +do_install:append() {
> > +    install -d ${D}${EXTENSION_DIR}
> > +    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.j=
s \
> > +                    ${WORKDIR}/sources/force-h264-youtube/manifest.jso=
n \
> > +                    ${D}${EXTENSION_DIR}/
> > +}
> > +
> > +FILES:${PN}:append =3D " ${EXTENSION_DIR}"
> > diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264=
.js b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
> > new file mode 100644
> > index 00000000..5e942321
> > --- /dev/null
> > +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
> > @@ -0,0 +1,4 @@
> > +(function() {
> > +    var orig =3D MediaSource.isTypeSupported.bind(MediaSource);
> > +    MediaSource.isTypeSupported =3D function(t) { return /vp8|vp09?|av=
01/i.test(t) ? false : orig(t); };
> > +})();
> > diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.j=
son b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
> > new file mode 100644
> > index 00000000..fc69be22
> > --- /dev/null
> > +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
rowser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
> > @@ -0,0 +1,19 @@
> > +{
> > +  "manifest_version": 3,
> > +  "name": "Force H.264",
> > +  "version": "1.0.0",
> > +  "description": "Lightweight extension that forces YouTube to play H.=
264 (avc1) by blocking VP8, VP9, and AV1",
> > +  "content_scripts": [
> > +    {
> > +      "matches": [
> > +        "*://*.youtube.com/*",
> > +        "*://*.youtube-nocookie.com/*",
> > +        "*://*.youtu.be/*"
> > +      ],
> > +      "js": ["force_h264.js"],
> > +      "run_at": "document_start",
> > +      "world": "MAIN",
> > +      "all_frames": true
> > +    }
> > +  ]
> > +}
> > --
> > 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17560): https://lists.yoctoproject.org/g/meta-arago/m=
essage/17560
> Mute This Topic: https://lists.yoctoproject.org/mt/119726830/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [jcormier@=
criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>


--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

