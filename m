Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F41AC02187
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 22:03:35 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.5123.1737065011953425618
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 16 Jan 2025 14:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=Kg+0yR50;
 spf=pass (domain: criticallink.com, ip: 209.85.167.52, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54024ecc33dso1440593e87.0
        for <meta-arago@lists.yoctoproject.org>; Thu, 16 Jan 2025 14:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1737065010; x=1737669810; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s78GabRVpxJDrrv2H+7y9jju+7zP6OQw7JlsEFlY0BE=;
        b=Kg+0yR50+Kf3B3niVLHngeUHzH/fYIaCaAuYdpB4OB2fCKNjT+1NqCVdcyjbMTpINg
         21VWi0eEJqmmWy1/e05EweCQfTHItDFf5ApPzcdR+kNS0Zftxmh7Jn8Th1Wok2n2pkcd
         1HBvdTNam3gHJt8l8LwtW3Kc6XIQ2gue5jpsA6TcoIm7/RSkaWCGIChj2isQLZo4N2RT
         tZhnpWc/0A6pUk9J6A3sS7CjS9v1O8u/3g0lR7QiF4O3vvK/lQbs/FxI93kbyiZmueVM
         YtiABk2H+OXrsGsirIyvZ3Sz9w6YK5kZBi3sDZ5OgTjf5wojaZpS+RwKiu/JC46953ej
         FGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737065010; x=1737669810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s78GabRVpxJDrrv2H+7y9jju+7zP6OQw7JlsEFlY0BE=;
        b=o2P+bFX+FoWGrFPGT5iDp+z4KsgrjHI3eTVd7bz5j6nDJbGNdhEcpHmgGD7L07ivwb
         JtmVfQeLYLSQLkaEW/ByzSbtWLIJY0RxzK9KikOpVs5w570kAKfxWLCFfr9ZgL14EAj0
         7J7yk85BJ6Op0P1DJCZyiV2OYs6AxMx9A9vuX5nrJbKgT+xyZqfRRUH18nxib17CT2pK
         pd+YyB38QFrbJW3OwCuZ5LnZUnLvsq8hzH+wJOFYZbIMiQGHAq4TFPUygMOb10gdKKle
         yawacipkhOPyf0qgaTyTMgCp7cz4q05TpQcFkTg1l29fdK+2o5DY1yAfcfqxTQrZn7Er
         Ue6g==
X-Forwarded-Encrypted: i=1; AJvYcCX1zjfDU1oxP5+oUUwkKiqECMYNYVg0b8X9RAy0L3QKum19VXj12NTlceRcNBoWJXq/UTA/lmRyk7h6@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy6i3tD9+zg/R481HmeHOZxLdGjoF6cseKjI0YDbSTfKdHe3XW6
	OFhvK+7Rh6BUVLM9z7y/3cf/tWp/hyTXG/cG8LDoVo0l1NY0bkxIlzMzqP4QGNpuih6fEAbTodF
	sVHdKkeQ+eDl/JRrtWEHnOm8uciwGLwcY0JMF
X-Gm-Gg: ASbGnctmTEb4iD6CKG3e2xMVoFM022jq6KX+hBHy7zQHWrq6SPjrQeXflvt8ENI9KaU
	aeUtuFiXMwdownFDiiYGsyRh0ghrgh/bwqRX8
X-Google-Smtp-Source: AGHT+IEE9BgUV9IhTjqEOjRN+Igse6nO0jpEpQ7pVcPbxREQ9ymRal1RvHCH5wm/OhD1DT/jKQs4IVGyjDnkL0iiM+Y=
X-Received: by 2002:a05:6512:e8d:b0:540:3561:666f with SMTP id
 2adb3069b0e04-5439c2410aamr40382e87.20.1737065009882; Thu, 16 Jan 2025
 14:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20250116135431.1937360-1-d-mittal@ti.com> <20250116205901.GG21836@denix.org>
In-Reply-To: <20250116205901.GG21836@denix.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 16 Jan 2025 17:03:18 -0500
X-Gm-Features: AbW1kvb9D1oaLT2dT4ISV-x-tkG66R7ITA2VX0FLKw3eypDFonrfjwUQZ73cXP4
Message-ID: <CADL8D3aMTPQ+yPSkcoDbXebR6CveUGo5RGE1H3gv+dg_99aUzQ@mail.gmail.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH] packagegroup-arago-base:
 Add mosquitto packages
To: denis@denix.org
Cc: d-mittal@ti.com, meta-arago@lists.yoctoproject.org, 
	Ryan Eatmon <reatmon@ti.com>, Karan Saxena <karan@ti.com>, Krunal Bhargav <k-bhargav@ti.com>, 
	Chirag Shilwant <c-shilwant@ti.com>
Content-Type: multipart/alternative; boundary="000000000000ddbe70062bd9f634"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 16 Jan 2025 22:03:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15697

--000000000000ddbe70062bd9f634
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Perhaps it would make more sense to add it to
packagegroup-arago-tisdk-addons.bb then you could add -dev package to
packagegroup-arago-tisdk-addons-sdk-target.bb?

On Thu, Jan 16, 2025 at 3:59=E2=80=AFPM Denys Dmytriyenko via lists.yoctopr=
oject.org
<denis=3Ddenix.org@lists.yoctoproject.org> wrote:

> On Thu, Jan 16, 2025 at 07:24:31PM +0530, Divyansh Mittal via
> lists.yoctoproject.org wrote:
> > Mosquitto is an open source (Eclipse licensed) message broker that
> > implements the MQ Telemetry Transport protocol providing both an MQTT
> > broker and several command-line clients.
> >
> > Signed-off-by: Divyansh Mittal <d-mittal@ti.com>
> > ---
> >  .../recipes-core/packagegroups/packagegroup-arago-base.bb    | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/
> packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups=
/
> packagegroup-arago-base.bb
> > index 121fa432..7634cb0c 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/
> packagegroup-arago-base.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/
> packagegroup-arago-base.bb
> > @@ -50,6 +50,11 @@ ARAGO_EXTRA =3D "\
> >      cifs-utils \
> >      phytool \
> >      lldpd \
> > +    mosquitto \
> > +    libmosquitto1 \
> > +    libmosquittopp1 \
>
> You don't need to explicitly list the libraries here. I haven't checked
> the
> mosquitto packaging, but I'm pretty sure either the main package or the
> clients one have the necessary dependencies. You do want to avoid
> explicitly
> listing libraries in here, especially since they contain the version
> number
> in their names when Debian renaming is enabled, or have completely
> different
> names otherwise.
>
>
> > +    mosquitto-clients \
> > +    mosquitto-dev \
>
> Do you really need the development package here. Especially in the "base"
> packagegroup, which is meant to be used for minimal and bootstrapping
> images.
>
> Just pulling a single -dev package like this will have a snowball effect
> and
> will explode the dependency tree with hundreds of other development
> packages,
> making the image suitable for runtime "development".
>
> I just did a quick experiment with tisdk-base-image, just adding
> mosquitto-dev
> the number of packages increased by 112 and the size grew by 20%. And I
> also
> see both mosquitto libraries being added automatically. Here's the list:
>
> acl
> acl-dev
> attr
> attr-dev
> base-files-dev
> base-passwd-dev
> bash-completion-dev
> bash-dev
> bzip2
> bzip2-dev
> cjson
> cjson-dev
> cryptodev-linux
> cryptodev-linux-dev
> dbus-dev
> kbd-dev
> kmod-dev
> libc-malloc-debug0
> libc6-dev
> libc6-extra-nss
> libc6-thread-db
> libc6-utils
> libcap-dev
> libcap-ng-dev
> libcrypt-dev
> libedit-dev
> libexpat-dev
> libffi-dev
> libform5
> libgcc-s-dev
> libgdbm-compat4
> libgdbm-dev
> libgdbm6
> libgirepository-1.0-1
> libgirepository-1.0-dev
> libglib-2.0-dev
> libmenu5
> libmosquitto1
> libmosquittopp1
> libnsl-dev
> libnsl3
> libnss-db2
> libpam-dev
> libpanel5
> libpcre2-16-0
> libpcre2-32-0
> libpcre2-dev
> libseccomp-dev
> libsqlite3-dev
> libstdc++-dev
> libticw5
> libtirpc-dev
> libuuid-dev
> libuv-dev
> libuv1
> libwebsockets-dev
> libwebsockets-evlib-uv
> libwebsockets19
> libxml2-dev
> libz-dev
> linux-libc-headers-dev
> mosquitto
> mosquitto-dev
> ncurses-dev
> openssl-dev
> perl
> perl-dev
> perl-module-config-heavy
> python3-asyncio
> python3-compile
> python3-crypt
> python3-ctypes
> python3-datetime
> python3-dev
> python3-difflib
> python3-email
> python3-html
> python3-io
> python3-json
> python3-logging
> python3-math
> python3-mime
> python3-netclient
> python3-netserver
> python3-numbers
> python3-packaging
> python3-packaging-dev
> python3-pickle
> python3-pkg-resources
> python3-pkgutil
> python3-plistlib
> python3-pprint
> python3-profile
> python3-setuptools
> python3-setuptools-dev
> python3-shell
> python3-stringold
> python3-threading
> python3-unittest
> python3-unixadmin
> python3-xml
> shadow-dev
> shadow-securetty-dev
> shared-mime-info-dev
> systemd-dev
> uthash-dev
> util-linux-dev
> volatile-binds-dev
> xz
> xz-dev
> zstd
> zstd-dev
>
> --
> Denys
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15696):
> https://lists.yoctoproject.org/g/meta-arago/message/15696
> Mute This Topic: https://lists.yoctoproject.org/mt/110646886/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211
<https://twitter.com/Critical_Link>

--000000000000ddbe70062bd9f634
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Perhaps it would make more sense to add it to <a href=3D"h=
ttp://packagegroup-arago-tisdk-addons.bb">packagegroup-arago-tisdk-addons.b=
b</a> then you could add -dev package to <a href=3D"http://packagegroup-ara=
go-tisdk-addons-sdk-target.bb">packagegroup-arago-tisdk-addons-sdk-target.b=
b</a>?</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jan 16, 2025 at 3:59=E2=80=AFPM Denys=
 Dmytriyenko via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproje=
ct.org</a> &lt;denis=3D<a href=3D"mailto:denix.org@lists.yoctoproject.org">=
denix.org@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, Jan 16, 2025 at 07:24:31PM +0530, =
Divyansh Mittal via <a href=3D"http://lists.yoctoproject.org" rel=3D"norefe=
rrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
&gt; Mosquitto is an open source (Eclipse licensed) message broker that<br>
&gt; implements the MQ Telemetry Transport protocol providing both an MQTT<=
br>
&gt; broker and several command-line clients.<br>
&gt; <br>
&gt; Signed-off-by: Divyansh Mittal &lt;<a href=3D"mailto:d-mittal@ti.com" =
target=3D"_blank">d-mittal@ti.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-core/packagegroups/<a href=3D"http://packagegroup-ar=
ago-base.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-arago-base.b=
b</a>=C2=A0 =C2=A0 | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta-arago-distro/recipes-core/packagegroups/<a href=3D"h=
ttp://packagegroup-arago-base.bb" rel=3D"noreferrer" target=3D"_blank">pack=
agegroup-arago-base.bb</a> b/meta-arago-distro/recipes-core/packagegroups/<=
a href=3D"http://packagegroup-arago-base.bb" rel=3D"noreferrer" target=3D"_=
blank">packagegroup-arago-base.bb</a><br>
&gt; index 121fa432..7634cb0c 100644<br>
&gt; --- a/meta-arago-distro/recipes-core/packagegroups/<a href=3D"http://p=
ackagegroup-arago-base.bb" rel=3D"noreferrer" target=3D"_blank">packagegrou=
p-arago-base.bb</a><br>
&gt; +++ b/meta-arago-distro/recipes-core/packagegroups/<a href=3D"http://p=
ackagegroup-arago-base.bb" rel=3D"noreferrer" target=3D"_blank">packagegrou=
p-arago-base.bb</a><br>
&gt; @@ -50,6 +50,11 @@ ARAGO_EXTRA =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cifs-utils \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 phytool \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 lldpd \<br>
&gt; +=C2=A0 =C2=A0 mosquitto \<br>
&gt; +=C2=A0 =C2=A0 libmosquitto1 \<br>
&gt; +=C2=A0 =C2=A0 libmosquittopp1 \<br>
<br>
You don&#39;t need to explicitly list the libraries here. I haven&#39;t che=
cked the <br>
mosquitto packaging, but I&#39;m pretty sure either the main package or the=
 <br>
clients one have the necessary dependencies. You do want to avoid explicitl=
y <br>
listing libraries in here, especially since they contain the version number=
 <br>
in their names when Debian renaming is enabled, or have completely differen=
t <br>
names otherwise.<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 mosquitto-clients \<br>
&gt; +=C2=A0 =C2=A0 mosquitto-dev \<br>
<br>
Do you really need the development package here. Especially in the &quot;ba=
se&quot; <br>
packagegroup, which is meant to be used for minimal and bootstrapping image=
s.<br>
<br>
Just pulling a single -dev package like this will have a snowball effect an=
d <br>
will explode the dependency tree with hundreds of other development package=
s, <br>
making the image suitable for runtime &quot;development&quot;.<br>
<br>
I just did a quick experiment with tisdk-base-image, just adding mosquitto-=
dev <br>
the number of packages increased by 112 and the size grew by 20%. And I als=
o <br>
see both mosquitto libraries being added automatically. Here&#39;s the list=
:<br>
<br>
acl<br>
acl-dev<br>
attr<br>
attr-dev<br>
base-files-dev<br>
base-passwd-dev<br>
bash-completion-dev<br>
bash-dev<br>
bzip2<br>
bzip2-dev<br>
cjson<br>
cjson-dev<br>
cryptodev-linux<br>
cryptodev-linux-dev<br>
dbus-dev<br>
kbd-dev<br>
kmod-dev<br>
libc-malloc-debug0<br>
libc6-dev<br>
libc6-extra-nss<br>
libc6-thread-db<br>
libc6-utils<br>
libcap-dev<br>
libcap-ng-dev<br>
libcrypt-dev<br>
libedit-dev<br>
libexpat-dev<br>
libffi-dev<br>
libform5<br>
libgcc-s-dev<br>
libgdbm-compat4<br>
libgdbm-dev<br>
libgdbm6<br>
libgirepository-1.0-1<br>
libgirepository-1.0-dev<br>
libglib-2.0-dev<br>
libmenu5<br>
libmosquitto1<br>
libmosquittopp1<br>
libnsl-dev<br>
libnsl3<br>
libnss-db2<br>
libpam-dev<br>
libpanel5<br>
libpcre2-16-0<br>
libpcre2-32-0<br>
libpcre2-dev<br>
libseccomp-dev<br>
libsqlite3-dev<br>
libstdc++-dev<br>
libticw5<br>
libtirpc-dev<br>
libuuid-dev<br>
libuv-dev<br>
libuv1<br>
libwebsockets-dev<br>
libwebsockets-evlib-uv<br>
libwebsockets19<br>
libxml2-dev<br>
libz-dev<br>
linux-libc-headers-dev<br>
mosquitto<br>
mosquitto-dev<br>
ncurses-dev<br>
openssl-dev<br>
perl<br>
perl-dev<br>
perl-module-config-heavy<br>
python3-asyncio<br>
python3-compile<br>
python3-crypt<br>
python3-ctypes<br>
python3-datetime<br>
python3-dev<br>
python3-difflib<br>
python3-email<br>
python3-html<br>
python3-io<br>
python3-json<br>
python3-logging<br>
python3-math<br>
python3-mime<br>
python3-netclient<br>
python3-netserver<br>
python3-numbers<br>
python3-packaging<br>
python3-packaging-dev<br>
python3-pickle<br>
python3-pkg-resources<br>
python3-pkgutil<br>
python3-plistlib<br>
python3-pprint<br>
python3-profile<br>
python3-setuptools<br>
python3-setuptools-dev<br>
python3-shell<br>
python3-stringold<br>
python3-threading<br>
python3-unittest<br>
python3-unixadmin<br>
python3-xml<br>
shadow-dev<br>
shadow-securetty-dev<br>
shared-mime-info-dev<br>
systemd-dev<br>
uthash-dev<br>
util-linux-dev<br>
volatile-binds-dev<br>
xz<br>
xz-dev<br>
zstd<br>
zstd-dev<br>
<br>
-- <br>
Denys<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15696): <a href=3D"https://lists.yoctoproject.org/g/met=
a-arago/message/15696" rel=3D"noreferrer" target=3D"_blank">https://lists.y=
octoproject.org/g/meta-arago/message/15696</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110646886/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110646886/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-arago%2Bowner@lists.yoctoproject.org" t=
arget=3D"_blank">meta-arago+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arago/unsub" =
rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-=
arago/unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_bl=
ank">jcormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
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
iv></div></div></div></div></div></div>

--000000000000ddbe70062bd9f634--

