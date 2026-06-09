Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEC7CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 18:52:07 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3223.1781031118406086356
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 11:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=OSyNjXT2;
 spf=pass (domain: criticallink.com, ip: 209.85.218.52, mailfrom: jcormier@criticallink.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bf84a2b2077so264293066b.2
        for <meta-arago@lists.yoctoproject.org>; Tue, 09 Jun 2026 11:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781031117; cv=none;
        d=google.com; s=arc-20240605;
        b=NJpBtcgonp9quG4kNmaGH8q1OnEy3OvMF4qpwspPpjmYElFHQc+egne9BedcV/6UYu
         YICUhefFwiw6I3GU1yu9YhIPzRZs3R4lsTrklskfrgitKxYErgnaPx4OXlTbSQqA4RsF
         CLHpJblhcz3sppatTi8xa02oq+tQBIXxJgHsmjuB4MZSRZDurY8tqbKqqofLaBIYStu8
         GAZ+Ho5UkFo0ly3ocpxrbDXJYLne6eteKWz5uwKF3sv1WJ09VobWZ8DJsT9ycJYNj9tZ
         1gxoqq11W5CdlfAD53686Nb4GI3faICuQR7AphNi6zGFcjqpkXKI3zLnUzXXtAAqmMxA
         zkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MM7bnMFQhfxnnMW0ToRC+b5BSui5Z7RpAvZnxwuxwWM=;
        fh=pet2gJA5a8FKCnMa0Tcew856xfvo0mtzieUH2eSWwJg=;
        b=PzY3rawLza2J5QypjiUHPmtIZ4mY1ZWoB1Tt3DRptwZRvsZmmUEaLdf5ORwWpDi2Lr
         PKgBPBcfJUnmiFjfM/aUKhoy5QGLV268YKMNSqkcd1G2fblwo1rxBWkiQKIEc++ApaBi
         OaGupYdgfcpSw3FkZhakXYbHDdBd/xfQukXo7Sn1PMcf9G5HmXhun/Ayz7d2NS40X929
         yywNG1G7xzohKujX583CeAr/5MdC1sDCFieCsOIJl22LOxBtTJqRYC2L3/dThbN2m4vm
         x7lDtH3/e6WMQFrJGVoQKTt/Jny9qrxyOWuPdeVPW51JjNkkRMEQhW7SMS+7TMLeQO2w
         u10A==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1781031117; x=1781635917; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MM7bnMFQhfxnnMW0ToRC+b5BSui5Z7RpAvZnxwuxwWM=;
        b=OSyNjXT2LaNZYdMQ507gkhcbUCatdYOzK82kY6LojGrrttcTxGIFSyNFx6y/yIkStU
         8hPkh27UE4diMwq6jVTHrVX6EPWJGz26qoBCt4Typw9SzbxG2xH6pYb8FwyHgTH759cS
         6sf94tooLlXTVNzS2yaX6Kyo7HhXk3DnvDrgsH92GDlUmYeqTfB6Vs08YKFowLb31K34
         AeWmUI7uRiYWJSrZt4Q4bVy6d06e8LCAFGhQJgAaxxkAySqzgiInb//UQQFxT/kyr361
         dGvzxSkDlY/uG4ZK1i56eBZMiU6JmEorkTFjxNU9gfZnVBdPpg6n3EFuQmRkXYqfKjnl
         5PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031117; x=1781635917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MM7bnMFQhfxnnMW0ToRC+b5BSui5Z7RpAvZnxwuxwWM=;
        b=egtPqloWVNDqamrA/jFsO0jeObOvNXY3yfQK0i6msmowlk0gZWQwcZIeFjWh+Q8PuO
         8q6tU+CqqI3iuVQHw9W6BqyCRr8Bq201CxhNnPMYIq5g7GnasV+UP8daBVAk3ssyDbqx
         2r4rE6UPTvQIPL4Js7i+n+Uuvv7BBOl9rBHGP/M9833ry/3hDJW96hB0vOyZTO20r1JK
         7AOCUwRjPxOZ//LWSb2KfRaCKqkMnOn8tqZlpsb0aNaHFExWv5GJiQeGQmHIYnOsy4wq
         bU9xbA+xF9MzDFi7Utf33+gB/8Np5idTTEg/aIor9EEGyJSHUwqNT5X1hWoGkyxxT1g3
         XUJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NMR5RJ6uljl31ufxHdXw7ELrQVNXXmAlGjO9cp4SxXZHdHsDnOpST6eYi1pz/oUr+jlsrFelkjauc@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxtgTQmTmjleYN8pHGjjferUL6Ld0Q8xQedii+vpFBtK3iY7B+V
	Uw3xO9dXolxNepxo2b3ukDbzgUAiVwAG380ijpzZN0ayY4MstsQgQ/b/cs0PWrmEmYRIC6vNVdJ
	XnBj7HPXR1j3Q6wd9IF9tTLIqWExCE7IlGuY6fdJs
X-Gm-Gg: Acq92OHTIp145aD7/kFnqz3OV0Isqe7eJXDQoItY69/LUx79aZ+QDA73+KNGy/vpmKI
	VWxxXyOZX32Hmx60E6XfrFM4eBYYBTjSGhejlQYIuKME3U8ev9rviX43ShiTM9oECMv4HV7vbPZ
	bFr2qS4ley6TVgZdrNUSaKMh5HoZ71i4tfneKhCFwbIKL5cX7yrvB8F9fzhD8ZhcgTPoi4cVKww
	C3qlEBOt7HfKX9J+/ZVlxdHuO6154FF33kZ2JKRc9dlz/a5UUJhVBNo96MGCC3/QHxXSE/5LnlI
	6KkA3MWAcqDp3WYX
X-Received: by 2002:a17:907:cca9:b0:bf9:9c64:c8 with SMTP id
 a640c23a62f3a-bf99c64077dmr134465566b.1.1781031116487; Tue, 09 Jun 2026
 11:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260609171306.238854-1-t-lannynd@ti.com> <20260609174255.GH23325@denix.org>
 <CADL8D3Y-7wywm0qb+T=mdbRm=+tN8rzJQ3-uffnjXvdo2pZ8Fg@mail.gmail.com> <cd75fd7e185645e690df5cf9eef0ed40@ti.com>
In-Reply-To: <cd75fd7e185645e690df5cf9eef0ed40@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 9 Jun 2026 14:51:43 -0400
X-Gm-Features: AVVi8CfPzO-7V-1vNmz3g5cv63Z92xr-TTUEBlJBk_9_fPDyeNvPD4zIrnPdUnk
Message-ID: <CADL8D3ZGa072xrKJZzyGM3vz4_2cgaSyikADjipBUfy1JuBREA@mail.gmail.com>
Subject: Re: [meta-arago][master/wrynose][PATCH v2] meta-arago-distro:
 chromium: add force-h264-youtube extension
To: "Lannynd, Thorsten" <t-lannynd@ti.com>
Cc: "denis@denix.org" <denis@denix.org>, 
	"meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>, "Eatmon, Ryan" <reatmon@ti.com>, 
	"Etheridge, Darren" <detheridge@ti.com>, "Brnich, Brandon" <b-brnich@ti.com>, 
	"Christidis, Antonios" <a-christidis@ti.com>
Content-Type: multipart/alternative; boundary="0000000000000852030653d69f64"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Jun 2026 18:52:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17563

--0000000000000852030653d69f64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 2:25=E2=80=AFPM Lannynd, Thorsten <t-lannynd@ti.com>=
 wrote:

> On 6/9/26 12:52 PM, Jon Cormier via lists.yoctoproject.org wrote:
> > On Tue, Jun 9, 2026 at 1:43=E2=80=AFPM Denys Dmytriyenko via
> lists.yoctoproject.org
> > <denis=3Ddenix.org@lists.yoctoproject.org> wrote:
> > >
> > > On Tue, Jun 09, 2026 at 12:13:06PM -0500, Thorsten Lannynd via
> > lists.yoctoproject.org wrote:
> > > > Install a lightweight Chrome extension that forces YouTube to serve
> > > > H.264 (avc1) by blocking VP8, VP9, and AV1 via
> > MediaSource.isTypeSupported.
> > > > This enables Wave5 hardware video decoding on YouTube, which only
> > > > supports
> > > > H.264 and HEVC.
> > > >
> > > > Installed at /usr/lib/chromium/extensions/force-h264-youtube
> > > > and --load-extension flag is needed to enable the extension.
> > > >
> > > > Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> > > > ---
> > > > v2:
> > > > - Remove the flag that enables extension by default as not all SoCs
> support
> > > >   Wave5 and Chromium
> > Why would disabling this extension help? Does this mean there are some
> SoCs
> > which do support VP8, VP9, and AV1?  Or if using CPU, decode those bett=
er
> > than h.264?
> H.264 and HEVC are the only codecs with hardware acceleration, however, w=
e
> have one SoC that supports Chromium with no hardware video decoder.
>
> Not enabling the extension gives the user control over what codec YouTube
> Is serving. I found the CPU utilization results to be roughly around the
> same,
> at 480p 30 fps when using S/W acceleration for AV1 and H.264 with
> significant playback stutters.
>
Alright thanks thats useful information.  I had recently been testing the
AM62A with youtube and was talking to a coworker about this extension.  So
glad to see it pop up here serendipitously.

>
> > >
> > > This is also fine, though requires enabling it manually...
> >
> > >
> > >
> > >
> > > >  .../chromium/chromium-ozone-wayland-arago.inc | 13 +++++++++++++
> > > >  .../force-h264-youtube/force_h264.js          |  4 ++++
> > > >  .../force-h264-youtube/manifest.json          | 19
> +++++++++++++++++++
> > > >  3 files changed, 36 insertions(+)
> > > >  create mode 100644
> > > > meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-bro=
w
> > > > ser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.j=
s
> > > >  create mode 100644
> > > > meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-bro=
w
> > > > ser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.jso=
n
> > > >
> > > > diff --git
> > > > a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
r
> > > > owser/chromium/chromium-ozone-wayland-arago.inc
> > > > b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
r
> > > > owser/chromium/chromium-ozone-wayland-arago.inc
> > > > index ab092fa1..d8eb0204 100644
> > > > ---
> > > > a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
r
> > > > owser/chromium/chromium-ozone-wayland-arago.inc
> > > > +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recip=
e
> > > > +++ s-browser/chromium/chromium-ozone-wayland-arago.inc
> > > > @@ -1,5 +1,7 @@
> > > >  PR:append =3D ".arago0"
> > > >
> > > > +EXTENSION_DIR =3D "/usr/lib/chromium/extensions/force-h264-youtube=
"
> > > > +
> > > >  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/chromium-ozone-wayland:"
> > > >
> > > >  PACKAGECONFIG:append =3D " proprietary-codecs"
> > > > @@ -9,4 +11,15 @@ SRC_URI:append =3D " \
> > > >
> file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-
> > to-V4L.patch \
> > > >
> file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-
> > V4L2.patch \
> > > >
> > > > file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.pa=
t
> > > > ch \
> > > > +                  file://force-h264-youtube/force_h264.js \
> > > > +                  file://force-h264-youtube/manifest.json \
> > > >                    "
> > > > +
> > > > +do_install:append() {
> > > > +    install -d ${D}${EXTENSION_DIR}
> > > > +    install -m 0644
> ${WORKDIR}/sources/force-h264-youtube/force_h264.js
> > \
> > > > +
> ${WORKDIR}/sources/force-h264-youtube/manifest.json \
> > > > +                    ${D}${EXTENSION_DIR}/ }
> > > > +
> > > > +FILES:${PN}:append =3D " ${EXTENSION_DIR}"
> > > > diff --git
> > > > a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
r
> > > > owser/chromium/chromium-ozone-wayland/force-h264-
> > youtube/force_h264.
> > > > js
> > > > b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
r
> > > > owser/chromium/chromium-ozone-wayland/force-h264-
> > youtube/force_h264.
> > > > js
> > > > new file mode 100644
> > > > index 00000000..5e942321
> > > > --- /dev/null
> > > > +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recip=
e
> > > > +++ s-browser/chromium/chromium-ozone-wayland/force-h264-
> > youtube/for
> > > > +++ ce_h264.js
> > > > @@ -0,0 +1,4 @@
> > > > +(function() {
> > > > +    var orig =3D MediaSource.isTypeSupported.bind(MediaSource);
> > > > +    MediaSource.isTypeSupported =3D function(t) { return
> > > > +/vp8|vp09?|av01/i.test(t) ? false : orig(t); }; })();
> > > > diff --git
> > > > a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
r
> > > > owser/chromium/chromium-ozone-wayland/force-h264-
> > youtube/manifest.js
> > > > on
> > > > b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-b=
r
> > > > owser/chromium/chromium-ozone-wayland/force-h264-
> > youtube/manifest.js
> > > > on
> > > > new file mode 100644
> > > > index 00000000..fc69be22
> > > > --- /dev/null
> > > > +++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recip=
e
> > > > +++ s-browser/chromium/chromium-ozone-wayland/force-h264-
> > youtube/man
> > > > +++ ifest.json
> > > > @@ -0,0 +1,19 @@
> > > > +{
> > > > +  "manifest_version": 3,
> > > > +  "name": "Force H.264",
> > > > +  "version": "1.0.0",
> > > > +  "description": "Lightweight extension that forces YouTube to pla=
y
> > > > +H.264 (avc1) by blocking VP8, VP9, and AV1",
> > > > +  "content_scripts": [
> > > > +    {
> > > > +      "matches": [
> > > > +        "*://*.youtube.com/*",
> > > > +        "*://*.youtube-nocookie.com/*",
> > > > +        "*://*.youtu.be/*"
> > > > +      ],
> > > > +      "js": ["force_h264.js"],
> > > > +      "run_at": "document_start",
> > > > +      "world": "MAIN",
> > > > +      "all_frames": true
> > > > +    }
> > > > +  ]
> > > > +}
> > > > --
> > > > 2.34.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#17560):
> > > https://lists.yoctoproject.org/g/meta-arago/message/17560
> > > Mute This Topic: https://lists.yoctoproject.org/mt/119726830/7902621
> > > Group Owner: meta-arago+owner@lists.yoctoproject.org
> > > Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub
> > > [jcormier@criticallink.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> > >
> >
> >
> > --
> > Jonathan Cormier
> > Senior Software Engineer
> >
> > Office:  315.425.4045 x222
> >
> > http://www.CriticalLink.com
> > 6712 Brooklawn Parkway, Syracuse, NY 13211
>


--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211

--0000000000000852030653d69f64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 9, =
2026 at 2:25=E2=80=AFPM Lannynd, Thorsten &lt;<a href=3D"mailto:t-lannynd@t=
i.com">t-lannynd@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On 6/9/26 12:52 PM, Jon Cormier via <a href=3D"http:=
//lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctop=
roject.org</a> wrote:<br>
&gt; On Tue, Jun 9, 2026 at 1:43=E2=80=AFPM Denys Dmytriyenko via <a href=
=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.yoctoproject.org</a><br>
&gt; &lt;denis=3D<a href=3D"mailto:denix.org@lists.yoctoproject.org" target=
=3D"_blank">denix.org@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Jun 09, 2026 at 12:13:06PM -0500, Thorsten Lannynd via<br=
>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D=
"_blank">lists.yoctoproject.org</a> wrote:<br>
&gt; &gt; &gt; Install a lightweight Chrome extension that forces YouTube t=
o serve<br>
&gt; &gt; &gt; H.264 (avc1) by blocking VP8, VP9, and AV1 via<br>
&gt; MediaSource.isTypeSupported.<br>
&gt; &gt; &gt; This enables Wave5 hardware video decoding on YouTube, which=
 only<br>
&gt; &gt; &gt; supports<br>
&gt; &gt; &gt; H.264 and HEVC.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Installed at /usr/lib/chromium/extensions/force-h264-youtube=
<br>
&gt; &gt; &gt; and --load-extension flag is needed to enable the extension.=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Thorsten Lannynd &lt;<a href=3D"mailto:t-lann=
ynd@ti.com" target=3D"_blank">t-lannynd@ti.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; v2:<br>
&gt; &gt; &gt; - Remove the flag that enables extension by default as not a=
ll SoCs support<br>
&gt; &gt; &gt;=C2=A0 =C2=A0Wave5 and Chromium<br>
&gt; Why would disabling this extension help? Does this mean there are some=
 SoCs<br>
&gt; which do support VP8, VP9, and AV1?=C2=A0 Or if using CPU, decode thos=
e better<br>
&gt; than h.264?<br>
H.264 and HEVC are the only codecs with hardware acceleration, however, we<=
br>
have one SoC that supports Chromium with no hardware video decoder.<br>
<br>
Not enabling the extension gives the user control over what codec YouTube<b=
r>
Is serving. I found the CPU utilization results to be roughly around the sa=
me,<br>
at 480p 30 fps when using S/W acceleration for AV1 and H.264 with<br>
significant playback stutters.<br></blockquote><div>Alright thanks thats us=
eful information.=C2=A0 I had recently been testing the AM62A with youtube =
and was talking to a coworker about this extension.=C2=A0 So glad to see it=
 pop up here serendipitously.=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
&gt; &gt;<br>
&gt; &gt; This is also fine, though requires enabling it manually...<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 .../chromium/chromium-ozone-wayland-arago.inc | 13 +++=
++++++++++<br>
&gt; &gt; &gt;=C2=A0 .../force-h264-youtube/force_h264.js=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++++<br>
&gt; &gt; &gt;=C2=A0 .../force-h264-youtube/manifest.json=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 19 +++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 3 files changed, 36 insertions(+)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; &gt; meta-arago-distro/dynamic-layers/chromium-browser-layer/reci=
pes-brow<br>
&gt; &gt; &gt; ser/chromium/chromium-ozone-wayland/force-h264-youtube/force=
_h264.js<br>
&gt; &gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; &gt; meta-arago-distro/dynamic-layers/chromium-browser-layer/reci=
pes-brow<br>
&gt; &gt; &gt; ser/chromium/chromium-ozone-wayland/force-h264-youtube/manif=
est.json<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git<br>
&gt; &gt; &gt; a/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-br<br>
&gt; &gt; &gt; owser/chromium/chromium-ozone-wayland-arago.inc<br>
&gt; &gt; &gt; b/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-br<br>
&gt; &gt; &gt; owser/chromium/chromium-ozone-wayland-arago.inc<br>
&gt; &gt; &gt; index ab092fa1..d8eb0204 100644<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; a/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-br<br>
&gt; &gt; &gt; owser/chromium/chromium-ozone-wayland-arago.inc<br>
&gt; &gt; &gt; +++ b/meta-arago-distro/dynamic-layers/chromium-browser-laye=
r/recipe<br>
&gt; &gt; &gt; +++ s-browser/chromium/chromium-ozone-wayland-arago.inc<br>
&gt; &gt; &gt; @@ -1,5 +1,7 @@<br>
&gt; &gt; &gt;=C2=A0 PR:append =3D &quot;.arago0&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +EXTENSION_DIR =3D &quot;/usr/lib/chromium/extensions/force-=
h264-youtube&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/chromium=
-ozone-wayland:&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 PACKAGECONFIG:append =3D &quot; proprietary-codecs&quo=
t;<br>
&gt; &gt; &gt; @@ -9,4 +11,15 @@ SRC_URI:append =3D &quot; \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-<br>
&gt; to-V4L.patch \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-<br>
&gt; V4L2.patch \<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-acc=
ess-.pat<br>
&gt; &gt; &gt; ch \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://force-h264-youtube/force_h264.js \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://force-h264-youtube/manifest.json \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +do_install:append() {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 install -d ${D}${EXTENSION_DIR}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/sources/force-h264=
-youtube/force_h264.js<br>
&gt; \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${WORKDIR}/sources/force-h264-youtube/manifest.json \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${D}${EXTENSION_DIR}/ }<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +FILES:${PN}:append =3D &quot; ${EXTENSION_DIR}&quot;<br>
&gt; &gt; &gt; diff --git<br>
&gt; &gt; &gt; a/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-br<br>
&gt; &gt; &gt; owser/chromium/chromium-ozone-wayland/force-h264-<br>
&gt; youtube/force_h264.<br>
&gt; &gt; &gt; js<br>
&gt; &gt; &gt; b/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-br<br>
&gt; &gt; &gt; owser/chromium/chromium-ozone-wayland/force-h264-<br>
&gt; youtube/force_h264.<br>
&gt; &gt; &gt; js<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 00000000..5e942321<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta-arago-distro/dynamic-layers/chromium-browser-laye=
r/recipe<br>
&gt; &gt; &gt; +++ s-browser/chromium/chromium-ozone-wayland/force-h264-<br=
>
&gt; youtube/for<br>
&gt; &gt; &gt; +++ ce_h264.js<br>
&gt; &gt; &gt; @@ -0,0 +1,4 @@<br>
&gt; &gt; &gt; +(function() {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 var orig =3D MediaSource.isTypeSupported.bind=
(MediaSource);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 MediaSource.isTypeSupported =3D function(t) {=
 return<br>
&gt; &gt; &gt; +/vp8|vp09?|av01/i.test(t) ? false : orig(t); }; })();<br>
&gt; &gt; &gt; diff --git<br>
&gt; &gt; &gt; a/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-br<br>
&gt; &gt; &gt; owser/chromium/chromium-ozone-wayland/force-h264-<br>
&gt; youtube/manifest.js<br>
&gt; &gt; &gt; on<br>
&gt; &gt; &gt; b/meta-arago-distro/dynamic-layers/chromium-browser-layer/re=
cipes-br<br>
&gt; &gt; &gt; owser/chromium/chromium-ozone-wayland/force-h264-<br>
&gt; youtube/manifest.js<br>
&gt; &gt; &gt; on<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 00000000..fc69be22<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta-arago-distro/dynamic-layers/chromium-browser-laye=
r/recipe<br>
&gt; &gt; &gt; +++ s-browser/chromium/chromium-ozone-wayland/force-h264-<br=
>
&gt; youtube/man<br>
&gt; &gt; &gt; +++ ifest.json<br>
&gt; &gt; &gt; @@ -0,0 +1,19 @@<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 &quot;manifest_version&quot;: 3,<br>
&gt; &gt; &gt; +=C2=A0 &quot;name&quot;: &quot;Force H.264&quot;,<br>
&gt; &gt; &gt; +=C2=A0 &quot;version&quot;: &quot;1.0.0&quot;,<br>
&gt; &gt; &gt; +=C2=A0 &quot;description&quot;: &quot;Lightweight extension=
 that forces YouTube to play<br>
&gt; &gt; &gt; +H.264 (avc1) by blocking VP8, VP9, and AV1&quot;,<br>
&gt; &gt; &gt; +=C2=A0 &quot;content_scripts&quot;: [<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 &quot;matches&quot;: [<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;*://*.<a href=3D"http://y=
outube.com/*" rel=3D"noreferrer" target=3D"_blank">youtube.com/*</a>&quot;,=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;*://*.<a href=3D"http://y=
outube-nocookie.com/*" rel=3D"noreferrer" target=3D"_blank">youtube-nocooki=
e.com/*</a>&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;*://*.<a href=3D"http://y=
outu.be/*" rel=3D"noreferrer" target=3D"_blank">youtu.be/*</a>&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 &quot;js&quot;: [&quot;force_h264.js&q=
uot;],<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 &quot;run_at&quot;: &quot;document_sta=
rt&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 &quot;world&quot;: &quot;MAIN&quot;,<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 &quot;all_frames&quot;: true<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; +=C2=A0 ]<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.34.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#17560):<br>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/g/meta-arago/message/17=
560" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/=
meta-arago/message/17560</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119=
726830/7902621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctopro=
ject.org/mt/119726830/7902621</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:meta-arago%2Bowner@lists.yoctoproj=
ect.org" target=3D"_blank">meta-arago+owner@lists.yoctoproject.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ara=
go/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/g/meta-arago/unsub</a><br>
&gt; &gt; [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_blank">j=
cormier@criticallink.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; Jonathan Cormier<br>
&gt; Senior Software Engineer<br>
&gt; <br>
&gt; Office:=C2=A0 315.425.4045 x222<br>
&gt; <br>
&gt; <a href=3D"http://www.CriticalLink.com" rel=3D"noreferrer" target=3D"_=
blank">http://www.CriticalLink.com</a><br>
&gt; 6712 Brooklawn Parkway, Syracuse, NY 13211<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div><div><div><div><div><div>Jonathan Cormier<br>Senio=
r Software Engineer<br><br>Office: =C2=A0315.425.4045 x222</div><div><img s=
rc=3D"https://www.criticallink.com/wp-content/uploads/critical-link-logo-em=
ail.png"><br></div><div><div><a href=3D"http://www.criticallink.com/" targe=
t=3D"_blank">http://www.CriticalLink.com</a></div></div></div>6712 Brooklaw=
n Parkway, Syracuse, NY 13211 </div></div></div></div></div><br></div></div=
></div>

--0000000000000852030653d69f64--

