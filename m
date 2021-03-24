Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 339735299C
	for <meta-arago@arago-project.org>;
	Wed, 24 Mar 2021 22:43:51 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12OMi9U2063704;
	Wed, 24 Mar 2021 17:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616625849;
	bh=349UkJo+kPcfg3DoImvGXqVC0k366iXvlYg3AWb0n4w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=peqFy4MeuR2ExK7aS3A4HU3oPV166mxEHjdOmg06YM5CauUOPVYVyhkgnvOeMz8+U
	BQhgfoev74mDr5OpJ2/JKknTakNZM/61exREigG6VzxB5G22S8fMkGrdtkwt+ObXqJ
	b46ddKCDMHjb0s9ahEIrmZzG0quoYVYQRNjtzNHw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12OMi9QT075362
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Mar 2021 17:44:09 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 24 Mar 2021 17:44:08 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.2176.009; Wed, 24 Mar 2021 17:44:08 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [EXTERNAL] [meta-arago] [oe-layersetup][PATCH]
	configs/arago-dunfell: more detailed template for enabling chromium
Thread-Index: AQHXICm84LEvm4DcBkeYfrhtr9X9LKqTNuIggACoMYD//9y40A==
Date: Wed, 24 Mar 2021 22:44:08 +0000
Message-ID: <546c64e843c24ecab92584a279fc0bde@ti.com>
References: <1616534150-46517-1-git-send-email-denis@denix.org>
	<fde77b5b52504418ab0f286f1a794bf1@ti.com>
	<20210324194215.GQ18041@denix.org>
In-Reply-To: <20210324194215.GQ18041@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.73.35]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] [oe-layersetup][PATCH] configs/arago-dunfell: more detailed template for enabling chromium
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
X-List-Received-Date: Wed, 24 Mar 2021 22:43:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Denys Dmytriyenko <denis@denix.org>
>Sent: Wednesday, March 24, 2021 2:42 PM
>To: Tammana, Gowtham <g-tammana@ti.com>
>Cc: meta-arago@arago-project.org
>Subject: Re: [EXTERNAL] [meta-arago] [oe-layersetup][PATCH] configs/arago-
>dunfell: more detailed template for enabling chromium
>
>On Wed, Mar 24, 2021 at 07:18:25PM +0000, Tammana, Gowtham wrote:
>>
>>
>> >-----Original Message-----
>> >From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-
>> >project.org> On Behalf Of Denys Dmytriyenko
>> >Sent: Tuesday, March 23, 2021 4:16 PM
>> >To: meta-arago@arago-project.org
>> >Subject: [EXTERNAL] [meta-arago] [oe-layersetup][PATCH] configs/arago-
>> >dunfell: more detailed template for enabling chromium
>> >
>> >Disabled (commented out) by default.
>> >
>> >Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>> >---
>> > configs/arago-dunfell-config.txt                  |  6 +++++-
>> > configs/arago-dunfell-next-config.txt             |  6 +++++-
>> > sample-files/bblayers-dunfell-browser.conf.sample | 12 ++++++++++++
>> > 3 files changed, 22 insertions(+), 2 deletions(-)
>> > create mode 100644 sample-files/bblayers-dunfell-browser.conf.sample
>> >
>> >diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-
>> >config.txt
>> >index b45ee3e..173499b 100644
>> >--- a/configs/arago-dunfell-config.txt
>> >+++ b/configs/arago-dunfell-config.txt
>> >@@ -3,7 +3,8 @@
>> >
>> > bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
>> > meta-arago,git://arago-project.org/git/meta-
>> >arago.git,dunfell,HEAD,layers=3Dmeta-arago-distro:meta-arago-extras
>> >-#meta-browser,git://github.com/OSSystems/meta-
>> >browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=3D
>> >+# meta-browser,git://github.com/OSSystems/meta-
>> >browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=3D
>> >+# meta-python2,git://git.openembedded.org/meta-
>> >python2,dunfell,HEAD,layers=3D
>>
>> I see chromium/qtwebengine python2 build related patches followed this.
>And I
>> am reading that commented layers here need to be enabled to build those
>recipes.
>> Isn't it or am I missing something else.
>>
>> Btw what's the current state of meta-python2, I recall from earlier that
>support
>> for it is being discontinued.
>
>Python2 has been EOL for over a year now, since beginning od 2020:
>https://www.python.org/doc/sunset-python-2/
>
>As of meta-python2 - it is a community-supported layer just to help people
>migrate to Python3. There's no official support for it and it is solely in
>hands of volunteers. It is not recommended to be used in new products.
>That
>is why the setup above is disabled by default.
>
>Unfortunately, Chromium (and qtwebengine uses Chromium engine) still
>depends
>on Python2 for now. The purpose of these patches is to cleanup recipes and
>provide a templaye for anyone willing to enable Chromium at own risk.=20

Thanks for the clarification, understood the intent behind these changes.
I have tried something similar for building qtwebengine earlier. Thanks for
these changes.

Reviewed-by: Gowtham Tammana <g-tammana@ti.com>

>--
>Denys
>
>> Gowtham
>>
>> > meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=3D
>> > meta-virtualization,git://git.yoctoproject.org/meta-
>> >virtualization,dunfell,HEAD,layers=3D
>> > meta-openembedded,git://git.openembedded.org/meta-
>> >openembedded,dunfell,HEAD,layers=3Dmeta-networking:meta-python:meta-
>oe:meta-
>> >gnome:meta-filesystems
>> >@@ -11,4 +12,7 @@ meta-ti,git://git.yoctoproject.org/meta-
>> >ti,dunfell,HEAD,layers=3D
>> > meta-arm,git://git.yoctoproject.org/meta-
>> >arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=3Dmeta-
>arm:meta-
>> >arm-toolchain
>> > oe-core,git://git.openembedded.org/openembedded-
>> >core,dunfell,HEAD,layers=3Dmeta
>> > OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>> >+# if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is
>> >enabled,
>> >+# use below for OECORELAYERCONF to mark it compatible with dunfell
>> >+#OECORELAYERCONF=3D./sample-files/bblayers-dunfell-browser.conf.sample
>> > OECORELOCALCONF=3D./sample-files/local-arago64.conf.sample
>> >diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-
>dunfell-
>> >next-config.txt
>> >index 8d629c4..9f5eeb9 100644
>> >--- a/configs/arago-dunfell-next-config.txt
>> >+++ b/configs/arago-dunfell-next-config.txt
>> >@@ -3,7 +3,8 @@
>> >
>> > bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
>> > meta-arago,git://arago-project.org/git/meta-arago.git,dunfell-
>> >next,HEAD,layers=3Dmeta-arago-distro:meta-arago-extras
>> >-#meta-browser,git://github.com/OSSystems/meta-
>> >browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=3D
>> >+# meta-browser,git://github.com/OSSystems/meta-
>> >browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=3D
>> >+# meta-python2,git://git.openembedded.org/meta-
>> >python2,dunfell,HEAD,layers=3D
>> > meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=3D
>> > meta-virtualization,git://git.yoctoproject.org/meta-
>> >virtualization,dunfell,HEAD,layers=3D
>> > meta-openembedded,git://git.openembedded.org/meta-
>> >openembedded,dunfell,HEAD,layers=3Dmeta-networking:meta-python:meta-
>oe:meta-
>> >gnome:meta-filesystems
>> >@@ -11,4 +12,7 @@ meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-
>> >next,HEAD,layers=3D
>> > meta-arm,git://git.yoctoproject.org/meta-
>> >arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=3Dmeta-
>arm:meta-
>> >arm-toolchain
>> > oe-core,git://git.openembedded.org/openembedded-
>> >core,dunfell,HEAD,layers=3Dmeta
>> > OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>> >+# if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is
>> >enabled,
>> >+# use below for OECORELAYERCONF to mark it compatible with dunfell
>> >+#OECORELAYERCONF=3D./sample-files/bblayers-dunfell-browser.conf.sample
>> > OECORELOCALCONF=3D./sample-files/local-arago64.conf.sample
>> >diff --git a/sample-files/bblayers-dunfell-browser.conf.sample
>b/sample-
>> >files/bblayers-dunfell-browser.conf.sample
>> >new file mode 100644
>> >index 0000000..1e525d5
>> >--- /dev/null
>> >+++ b/sample-files/bblayers-dunfell-browser.conf.sample
>> >@@ -0,0 +1,12 @@
>> >+# This template file was created by taking the oe-
>> >core/meta/conf/bblayers.conf
>> >+# file and removing the BBLAYERS section at the end.
>> >+
>> >+# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
>> >+# changes incompatibly
>> >+LCONF_VERSION =3D "6"
>> >+
>> >+BBPATH =3D "${TOPDIR}"
>> >+BBFILES ?=3D ""
>> >+
>> >+OVERRIDES =3D "forcevariable"
>> >+LAYERSERIES_COMPAT_browser-layer_forcevariable =3D "dunfell"
>> >--
>> >2.7.4
>> >
>> >_______________________________________________
>> >meta-arago mailing list
>> >meta-arago@arago-project.org
>> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>

