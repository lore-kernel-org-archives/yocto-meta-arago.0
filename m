Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 0AA305299C
	for <meta-arago@arago-project.org>;
	Tue, 16 Mar 2021 01:31:30 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12G1Vlf3086221;
	Mon, 15 Mar 2021 20:31:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615858307;
	bh=9CT1OJboL02SKFEKW9Hp52C/N8p4Y4Y1k6QDun6qRTE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=L6sJ3DVTg+abbEIqlk0bHOkxKZID41cQIzT+ofsgYj/D+CEDaY/nBK1r3niiDl7T4
	vKaakLbmQ5HY89vvBEAGvnNTYFejy51E99gZneRXrZMoA6GPPxHqhJSD59MLoS5vyq
	wRvgShQChmmCzBlbsZpH8sKRwEk0tdkEHmu9DFRQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12G1VlfS023536
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Mar 2021 20:31:47 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 15 Mar 2021 20:31:46 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.2176.009; Mon, 15 Mar 2021 20:31:46 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [EXTERNAL] Re: [meta-arago] [PATCH] gstreamer1.0-plugins-good:
	backport qmlglsink EGL build fix
Thread-Index: AQHXF47Ppd8os8Y3/EK2kDrGfLcRqaqBWb+AgAR9c8A=
Date: Tue, 16 Mar 2021 01:31:46 +0000
Message-ID: <90f826b820e04949a5d09bccdadaf7f8@ti.com>
References: <20210312222652.14023-1-g-tammana@ti.com>
	<20210312225047.GC4892@denix.org>
In-Reply-To: <20210312225047.GC4892@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.43.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] Re: [PATCH] gstreamer1.0-plugins-good: backport qmlglsink EGL build fix
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Mar 2021 01:31:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Denys Dmytriyenko <denis@denix.org>
>Sent: Friday, March 12, 2021 4:51 PM
>To: Tammana, Gowtham <g-tammana@ti.com>
>Cc: meta-arago@arago-project.org
>Subject: [EXTERNAL] Re: [meta-arago] [PATCH] gstreamer1.0-plugins-good:
>backport qmlglsink EGL build fix
>
>On Fri, Mar 12, 2021 at 04:26:52PM -0600, Gowtham Tammana wrote:
>> Backport qmlglsink build fix for EGL platform with no X11 headers.
>>
>> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> ---
>>  ...ild-on-EGL-platform-without-X11-head.patch | 36 +++++++++++++++++++
>>  .../gstreamer1.0-plugins-good_1.16.%.bbappend |  3 +-
>>  2 files changed, 38 insertions(+), 1 deletion(-)
>>  create mode 100644 meta-arago-extras/recipes-
>multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-on=
-
>EGL-platform-without-X11-head.patch
>>
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0=
-
>plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-
>head.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
>plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-
>head.patch
>> new file mode 100644
>> index 00000000..79db0e27
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
>plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-
>head.patch
>> @@ -0,0 +1,36 @@
>> +From 85229adbddcd8e7cacd5ebd9467c834352a882d0 Mon Sep 17 00:00:00 2001
>> +From: Philipp Zabel <p.zabel@pengutronix.de>
>> +Date: Tue, 3 Dec 2019 11:36:07 +0100
>> +Subject: [PATCH] qmlglsink: fix build on EGL platform without X11
>headers
>> +
>> +If Mesa is built without X11 headers, building against Mesa EGL headers
>> +requires a dependency on egl.pc, to define MESA_EGL_NO_X11_HEADERS.
>> +This fixes a build error when compiling ext/qt/gstqtglutility.cc:
>> +
>> +  In file included from /usr/include/EGL/egl.h:39,
>> +                   from /usr/include/gstreamer-
>1.0/gst/gl/egl/gstegl.h:44,
>> +                   from ../gst-plugins-good-
>1.16.1/ext/qt/gstqtglutility.cc:43:
>> +  /usr/include/EGL/eglplatform.h:124:10: fatal error: X11/Xlib.h: No
>such file or directory
>
>Thanks for the backport! We've seen this issue in the past in other places
>too, e.g.:

That is correct, earlier we were explicitly adding the #define in the
headers as a quick workaround. Got around this again as part of migration,
and noticed the dependency miss and the patch in master.

>https://github.com/meta-qt5/meta-
>qt5/commit/41666ddba78ff1f094310589489e0a070e0094d8
>http://arago-project.org/git/meta-arago.git?p=3Dmeta-
>arago.git;a=3Dcommitdiff;h=3D1e83ebf61bd22ca8ad04d5538db044d81330df2c

Thanks for these links, will submit patches to revert these as followup.

>
>> +Upstream-Status: Backport [c47a585052fba6830a2cddd8caa18e2305596ed0]
>
>Special thanks for Upstream-Status! :)
>
>
>> +Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>
>Reviewed-by: Denys Dmytriyenko <denis@denix.org>

Thanks for the review.
Gowtham

>
>> +---
>> + ext/qt/meson.build | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/ext/qt/meson.build b/ext/qt/meson.build
>> +index 5f040c844..43ddc6092 100644
>> +--- a/ext/qt/meson.build
>> ++++ b/ext/qt/meson.build
>> +@@ -89,6 +89,8 @@ if have_cxx and build_gstgl
>> +     if gst_gl_have_platform_egl
>> +       # Embedded linux (e.g. i.MX6) with or without windowing support
>> +       qt_defines +=3D ['-DHAVE_QT_EGLFS']
>> ++      egl_dep =3D dependency('egl', required : false)
>> ++      optional_deps +=3D egl_dep
>> +       have_qt_windowing =3D true
>> +       if have_qpa_include
>> +         # Wayland windowing
>> +--
>> +2.17.1
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0=
-
>plugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-
>multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
>> index 004a9968..e2ddbc27 100644
>> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
>plugins-good_1.16.%.bbappend
>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
>plugins-good_1.16.%.bbappend
>> @@ -7,6 +7,7 @@ SRC_URI +=3D " \
>>      file://0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch \
>>      file://0001-v4l2object-Update-formats-table-to-include-YUV422-
>mu.patch \
>>      file://0001-v4l2src-Check-for-drm-memory-support-in-try_import.patc=
h
>\
>> +    file://0001-qmlglsink-fix-build-on-EGL-platform-without-X11-
>head.patch \
>>  "
>>
>> -PR_append =3D ".arago2"
>> +PR_append =3D ".arago3"
>> --
>> 2.29.0
>
>--
>Regards,
>Denys Dmytriyenko <denis@denix.org>
>PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
>Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

