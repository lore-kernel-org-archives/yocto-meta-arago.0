Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6387F52986
	for <meta-arago@arago-project.org>;
	Tue, 14 Jan 2014 12:47:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0EClmOV003363;
	Tue, 14 Jan 2014 06:47:48 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0EClmNU004298;
	Tue, 14 Jan 2014 06:47:48 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 14 Jan 2014 06:47:48 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [oe-layersetup][PATCH] oe-layertool-setup: add
	ARAGO_BRAND to BB_ENV_EXTRAWHITE to accept on command line
Thread-Index: AQHPEKlsfQqAbq9BSEyE4IiXVnOWuZqELEKQ
Date: Tue, 14 Jan 2014 12:47:47 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101598EF3B5@DLEE11.ent.ti.com>
References: <1389649769-6640-1-git-send-email-denis@denix.org>
In-Reply-To: <1389649769-6640-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [oe-layersetup][PATCH] oe-layertool-setup: add ARAGO_BRAND to BB_ENV_EXTRAWHITE to accept on command line
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
X-List-Received-Date: Tue, 14 Jan 2014 12:47:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, January 13, 2014 3:49 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [oe-layersetup][PATCH] oe-layertool-setup:
>add ARAGO_BRAND to BB_ENV_EXTRAWHITE to accept on command line
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> oe-layertool-setup.sh | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
>index 99df1d9..ab66ef3 100755
>--- a/oe-layertool-setup.sh
>+++ b/oe-layertool-setup.sh
>@@ -805,7 +805,7 @@ unset BITBAKEDIR
> unset SCRIPTS
> export PATH
> export BUILDDIR=3D${builddir}
>-export BB_ENV_EXTRAWHITE=3D"MACHINE DISTRO TCMODE TCLIBC http_proxy
>ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID
>SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS
>PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD
>SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND
>EXTRA_TISDK_FILES TISDK_VERSION"
>+export BB_ENV_EXTRAWHITE=3D"MACHINE DISTRO TCMODE TCLIBC http_proxy
>ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID
>SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS
>PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD
>SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND
>EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND"
> EOM
> }
>
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

