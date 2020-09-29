Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 1CA2C52991
	for <meta-arago@arago-project.org>;
	Tue, 29 Sep 2020 16:58:57 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08TGtwtU072231
	for <meta-arago@arago-project.org>; Tue, 29 Sep 2020 11:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601398558;
	bh=R/+GzD2D7PY79DRKZWAFiG2qUN+zhaQJND+nXXlJGyM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=IdEhmxRS1X6MOyk0Hriu0fDJ49Oe0hAClLTHFLZCv1mFxqmuU/zg2A7cMUXCOUfpf
	GYOgVHcoaYdhNUEdYZwlxL614r9p0YRFjXP3MdBJ8nq243Rz4FrHA30x4208U+GiAn
	0R5XeZfLw+vZpdffXP87RSePjUFXlfIbI51/7Ba8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08TGtvee064673
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 29 Sep 2020 11:55:57 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 29 Sep 2020 11:55:57 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1979.003; Tue, 29 Sep 2020 11:55:57 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago][master/dunfell][PATCH] kmscube: enable gles3
	targets conditionally
Thread-Index: AQHWlmHFw6Z/cQzQr0yrfQKrbYtzMqmADl2A///HhFA=
Date: Tue, 29 Sep 2020 16:55:57 +0000
Message-ID: <c7b2019fb81d4cac8214ece1a58d6a3c@ti.com>
References: <20200929130930.13211-1-g-tammana@ti.com>
	<20200929151733.GA7434@beryl>
In-Reply-To: <20200929151733.GA7434@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.49.252]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [master/dunfell][PATCH] kmscube: enable gles3 targets conditionally
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
X-List-Received-Date: Tue, 29 Sep 2020 16:58:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Tuesday, September 29, 2020 10:18 AM
>To: Tammana, Gowtham
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago][master/dunfell][PATCH] kmscube: enable gles3
>targets conditionally
>
>On Tue, Sep 29, 2020 at 08:09:30AM -0500, Gowtham Tammana wrote:
>> Patch kmscube to enable gles3 targets conditionally, as not all glesv2
>> targets support glesv3.
>
>Looks good, except this one at the end:
>+PR_APPEND =3D ".arago1"

Good catch. Will send a v2.

Thanks,
Gowtham

>
>> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> ---
>>  .../0001-meson-check-for-gles3-support.patch  | 50 +++++++++++++++++++
>>  .../kmscube/kmscube_%.bbappend                |  7 +++
>>  2 files changed, 57 insertions(+)
>>  create mode 100644 meta-arago-distro/recipes-
>graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch
>>  create mode 100644 meta-arago-distro/recipes-
>graphics/kmscube/kmscube_%.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-
>meson-check-for-gles3-support.patch b/meta-arago-distro/recipes-
>graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch
>> new file mode 100644
>> index 00000000..67d7aca7
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-
>check-for-gles3-support.patch
>> @@ -0,0 +1,50 @@
>> +From 9f7efd751a3cdceaeefa6c215a81aa6368857e40 Mon Sep 17 00:00:00 2001
>> +From: Gowtham Tammana <g-tammana@ti.com>
>> +Date: Mon, 28 Sep 2020 21:15:52 -0500
>> +Subject: [PATCH] meson: check for gles3 support
>> +
>> +Some cores don't support gles3, so compile gles3 targets
>> +conditionally.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> +---
>> + meson.build | 22 +++++++++++++++-------
>> + 1 file changed, 15 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/meson.build b/meson.build
>> +index df9c315..8bba902 100644
>> +--- a/meson.build
>> ++++ b/meson.build
>> +@@ -91,12 +91,20 @@ else
>> +   message('Building without gstreamer support')
>> + endif
>> +
>> +-executable('kmscube', sources, dependencies : dep_common, install :
>true)
>> ++# GLES3 check
>> ++gles3_h =3D false
>> ++if dep_gles2.found()
>> ++  gles3_h =3D cc.has_header('GLES3/gl3.h', dependencies: dep_gles2)
>> ++  message('Building with GLES3 support')
>> ++endif
>> +
>> ++executable('kmscube', sources, dependencies : dep_common, install :
>true)
>> +
>> +-executable('texturator', files(
>> +-	'common.c',
>> +-	'drm-legacy.c',
>> +-	'drm-common.c',
>> +-	'texturator.c',
>> +-), dependencies : dep_common, install : true)
>> ++if gles3_h
>> ++  executable('texturator', files(
>> ++    'common.c',
>> ++    'drm-legacy.c',
>> ++    'drm-common.c',
>> ++    'texturator.c',
>> ++  ), dependencies : dep_common, install : true)
>> ++endif
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-arago-distro/recipes-
>graphics/kmscube/kmscube_%.bbappend b/meta-arago-distro/recipes-
>graphics/kmscube/kmscube_%.bbappend
>> new file mode 100644
>> index 00000000..7b27c894
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
>> @@ -0,0 +1,7 @@
>> +FILESEXTRAPATHS_append :=3D "${THISDIR}/${PN}:"
>> +
>> +SRC_URI +=3D " \
>> +file://0001-meson-check-for-gles3-support.patch \
>> +"
>> +
>> +PR_APPEND =3D ".arago1"
>> --
>> 2.17.1
>>

