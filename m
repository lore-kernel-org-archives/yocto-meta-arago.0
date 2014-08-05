Return-Path: <btv1==294f11ee0bf==Matt.Schuckmann@planar.com>
Received: from barbvt11.planar.com (mail.planar.com [199.244.172.52])
	by arago-project.org (Postfix) with ESMTP id B1C1A52972
	for <meta-arago@arago-project.org>;
	Tue,  5 Aug 2014 17:44:33 +0000 (UTC)
X-ASG-Debug-ID: 1407260669-04afd21682ef0180001-NloGV9
Received: from msxbvt03.planar.net ([172.16.0.147]) by barbvt11.planar.com
	with ESMTP id l6jYvz1ivwP59f8D for <meta-arago@arago-project.org>;
	Tue, 05 Aug 2014 10:44:29 -0700 (PDT)
X-Barracuda-Envelope-From: Matt.Schuckmann@planar.com
Received: from MSXBEBVT12.planar.net ([::1]) by msxbvt03.planar.net ([::1])
	with mapi; Tue, 5 Aug 2014 10:44:29 -0700
From: Matt Schuckmann <Matt.Schuckmann@planar.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Date: Tue, 5 Aug 2014 10:44:28 -0700
Thread-Topic: i686 binutils failing to build for SDK 7.0 build
X-ASG-Orig-Subj: i686 binutils failing to build for SDK 7.0 build
Thread-Index: Ac+w1OfjdhkurS5YTxWRUPtkx9YdLA==
Message-ID: <4B07ADD556F70043925DA2E9C5D4346D2FD85EA011@MSXBEBVT12.planar.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[172.16.0.147]
X-Barracuda-Start-Time: 1407260669
X-Barracuda-URL: http://10.10.111.113:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at planar.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0024 1.0000 -2.0052
X-Barracuda-Spam-Score: -2.01
X-Barracuda-Spam-Status: No,
	SCORE=-2.01 using per-user scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.8141
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
Subject: i686 binutils failing to build for SDK 7.0 build
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
X-List-Received-Date: Tue, 05 Aug 2014 17:44:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm trying to build a basic image using Arago, SDK 7.0 config (configs/amsd=
k/amsdk-07.00.00.00-config.txt) and binutils 2.20.1 is failing to compile f=
or the i686 host system.=20
I'm building on a Ubuntu 14.04 32bit VM.=20

My bitbake command is:=20
MACHINE=3Dam335x-evm;bitbake core-image-minimal

The errors are:
binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:326: unknown =
command `colophon'
binutils-native/2.20.1-r9/binutils-2.20.1/bfd/doc/bfd.texinfo:337: unknown =
command `cygnus'

It looks like this was a known problem for building binutils that has been =
fixed a long time ago and since SDK 7.0 is released code I would have assum=
ed the problem was taken care for the Arago build so I'm a little puzzled w=
hy I'm getting this now.=20

Any help would be appreciated.=20
Thanks,
Matt S.=20

