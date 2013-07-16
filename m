Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0392952A07
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2013 12:58:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6GCwcjL017442;
	Tue, 16 Jul 2013 07:58:38 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6GCwcSU005255;
	Tue, 16 Jul 2013 07:58:38 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 16 Jul 2013 07:58:35 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Christian Gagneraud <chgans@gna.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [arago/yocto-1.3] crda and python-m2crypto
Thread-Index: AQHOgRsuiHrJSYYY70Cvl2QARu6gXZlnRXrA
Date: Tue, 16 Jul 2013 12:58:34 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596576BD@DLEE11.ent.ti.com>
References: <51E386CF.9030704@gna.org>
In-Reply-To: <51E386CF.9030704@gna.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [arago/yocto-1.3] crda and python-m2crypto
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
X-List-Received-Date: Tue, 16 Jul 2013 12:58:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Christian Gagneraud
>Sent: Monday, July 15, 2013 12:21 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [arago/yocto-1.3] crda and python-m2crypto
>
>Hi,
>
>While building an image with arago-stable/yocto-1.3, I encountered
>an error:
>DEBUG: Executing shell function do_compile
>NOTE: make -j 8 MAKEFLAGS=3D all_noverify
>   GEN  keys-gcrypt.c
>   CC   crda.o
>   CC   intersect.o
>   Trusted pubkeys: pubkeys/linville.key.pub.pem
>   CC   print-regdom.o
>   CC   regdbdump.o
>ERROR: Failed to import the "M2Crypto" module: No module named
>M2Crypto
>Please install the "M2Crypto" Python module.
>On Debian GNU/Linux the package is called "python-m2crypto".
>make: *** [keys-gcrypt.c] Error 1
>make: *** Waiting for unfinished jobs....
>ERROR: oe_runmake failed
>ERROR: Function failed: do_compile (see
>/home/christiaga/projects/yocto/arago/build/arago-tmp-external-
>linaro-toolchain/work\
>/armv7ahf-vfp-neon-oe-linux-gnueabi/crda-1.1.1-
>r0/temp/log.do_compile.15753
>for further information)
>
>Basically crda doesn't build because it needs python-m2crypto,
>i've
>installed it via apt-get and everything was fine then.
>This is not documented in [1], [2] nor in [3].
>
>After digging a bit I found that the CRDA recipe comes from
>arago-distro-extras, but it can be found in
>meta-openembedded/meta-networking (on master, not on danny branch)
>as
>well. Looking at [4], it seems this version would have this
>dependency
>built by bitbake (python-m2crypto-native), again python-m2crypto-
>native
>is available only on master, not on danny.

In the meta-arago danny branch there is a python-m2crypto recipe that exten=
ds native.  So can you add the DEPENDS on python-m2crypto-native to the crd=
a recipe with danny and have this work?  Is that the solution you are menti=
oning?

>
>Do you want me to open a bug report somewhere?
>
>Regards,
>Chris
>
>[1]
>http://www.yoctoproject.org/docs/1.1/yocto-project-qs/yocto-
>project-qs.html
>[2]
>http://arago-
>project.org/wiki/index.php/Setting_Up_Build_Environment#Host_tools
>[3] http://www.openembedded.org/wiki/Getting_started
>[4]
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

