Return-Path: <firat.kasmis@steinbeis-stg.de>
Received: from smtprelay01.ispgateway.de (smtprelay01.ispgateway.de
	[80.67.31.39])
	by arago-project.org (Postfix) with ESMTPS id 3B9AC52AAD
	for <meta-arago@arago-project.org>;
	Tue,  9 Jul 2013 08:58:27 +0000 (UTC)
Received: from [10.128.0.3] (helo=exchange.df.eu)
	by smtprelay01.ispgateway.de with esmtps (TLSv1:RC4-MD5:128)
	(Exim 4.68) (envelope-from <firat.kasmis@steinbeis-stg.de>)
	id 1UwTkf-0003eh-K5
	for meta-arago@arago-project.org; Tue, 09 Jul 2013 10:58:25 +0200
Received: from ECCR11PUBLIC.exchange.local ([10.128.2.94]) by
	efe03.exchange.local ([10.128.0.3]) with mapi;
	Tue, 9 Jul 2013 10:58:25 +0200
From: Firat Kasmis <firat.kasmis@steinbeis-stg.de>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Date: Tue, 9 Jul 2013 10:58:50 +0200
Thread-Topic: Building am180x-evm
Thread-Index: Ac58gGugjsqCWaEDSlawSKScdfhEDg==
Message-ID: <766D943268E37941B447D0C68B4D7048115BE280CA@ECCR11PUBLIC.exchange.local>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: Building am180x-evm
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
X-List-Received-Date: Tue, 09 Jul 2013 08:58:27 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I just saw that http://arago-project.org/wiki/index.php/Setting_Up_Build_En=
vironment has been changed, so I tried building a file system and kernel fo=
r da850-omapl138-evm board like before following the new instructions.

Unfortunately this board is not available in meta-ti/conf/machine/ anymore.=
 Since am180x-evm is the same, I tried:

> MACHINE=3Dam180x-evm bitbake virtual/kernel
ERROR: No valid toolchain in PATH

Linaro is of course in my path. So after a bit of googling I tried:

> export TOOLCHAIN_BRAND=3Dlinaro
> MACHINE=3Dam180x-evm bitbake virtual/kernel
Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (armv5).Too=
lchain tunings invalid:
Tuning 'cortexa8thf-neon' has no defined features, and cannot be used.

I could solve the first one by doing in tune-arm926ejs.inc:

+TUNE_FEATURES =3D "${TUNE_FEATURES_tune-armv5te} arm926ejs"
-TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} arm926ejs"

+PACKAGE_EXTRA_ARCHS =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
-PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5te=
}"

But the second one with 'cortexa8thf-neon' still exists but I don't know wh=
ere it is exactly been set. toolchain-linaro/gcc.inc is using this as DEFAU=
LTUNE . Shouldn't this be arm926ejs for my machine?

Regards,
Firat



