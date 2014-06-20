Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9348652A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:10:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJAc1b022000;
	Fri, 20 Jun 2014 14:10:38 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJAbdC018974;
	Fri, 20 Jun 2014 14:10:37 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:10:37 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 14/19] toolchain-external: bb.which() is
	not part of bb.utils module
Thread-Index: AQHPjLJu7y9NZEonGky/EPEE3skECpt6XSkg
Date: Fri, 20 Jun 2014 19:10:37 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D0D9475@DLEE11.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-15-git-send-email-denis@denix.org>
In-Reply-To: <1403287009-11256-15-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 14/19] toolchain-external: bb.which() is not part of bb.utils module
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
X-List-Received-Date: Fri, 20 Jun 2014 19:10:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Do you mean is "now" part of bb.utils module?

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, June 20, 2014 12:57 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 14/19] toolchain-external: bb.which()
>is not part of bb.utils module
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/conf/distro/include/toolchain-external.inc | 2
>+-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/meta-arago-distro/conf/distro/include/toolchain-
>external.inc b/meta-arago-distro/conf/distro/include/toolchain-
>external.inc
>index 5356082..4d14c00 100644
>--- a/meta-arago-distro/conf/distro/include/toolchain-external.inc
>+++ b/meta-arago-distro/conf/distro/include/toolchain-external.inc
>@@ -1,4 +1,4 @@
> # Locate the toolchain automatically from PATH
>-TOOLCHAIN_SYSPATH :=3D
>"${@os.path.abspath(os.path.dirname(bb.which(d.getVar('PATH', d,
>1), d.getVar('TOOLCHAIN_PREFIX', d,
>1)+'cpp'))+'/../'+d.getVar('TOOLCHAIN_SYS', d, 1))}"
>+TOOLCHAIN_SYSPATH :=3D
>"${@os.path.abspath(os.path.dirname(bb.utils.which(d.getVar('PATH'
>, d, 1), d.getVar('TOOLCHAIN_PREFIX', d,
>1)+'cpp'))+'/../'+d.getVar('TOOLCHAIN_SYS', d, 1))}"
> TOOLCHAIN_PATH :=3D "${@bool(d.getVar('TOOLCHAIN_SYSPATH', d, 1))
>and (os.path.exists(d.getVar('TOOLCHAIN_SYSPATH', d, 1)) and
>os.path.dirname(d.getVar('TOOLCHAIN_SYSPATH', d, 1)) or
>bb.fatal('No valid toolchain in PATH')) or ''}"
> EXTERNAL_TOOLCHAIN =3D "${TOOLCHAIN_PATH}"
>--
>2.0.0
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

