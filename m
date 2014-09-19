Return-Path: <btv1==33924f8bcc2==Matt.Schuckmann@planar.com>
Received: from barbvt10.planar.com (mail.planar.com [199.244.172.52])
	by arago-project.org (Postfix) with ESMTP id 1F718529B7
	for <meta-arago@arago-project.org>;
	Fri, 19 Sep 2014 00:04:14 +0000 (UTC)
X-ASG-Debug-ID: 1411085050-04b02b73843fbcf0001-NloGV9
Received: from msxbvt03.planar.net ([172.16.0.147]) by barbvt10.planar.com
	with ESMTP id HJM9nxZl5v0hY1Ju for <meta-arago@arago-project.org>;
	Thu, 18 Sep 2014 17:04:10 -0700 (PDT)
X-Barracuda-Envelope-From: Matt.Schuckmann@planar.com
Received: from MSXBEBVT12.planar.net ([::1]) by msxbvt03.planar.net ([::1])
	with mapi; Thu, 18 Sep 2014 17:04:10 -0700
From: Matt Schuckmann <Matt.Schuckmann@planar.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Date: Thu, 18 Sep 2014 17:04:09 -0700
Thread-Topic: Is it MACHINE_GUI_CLASS or GUI_MACHINE_CLASS
X-ASG-Orig-Subj: Is it MACHINE_GUI_CLASS or GUI_MACHINE_CLASS
Thread-Index: Ac/TnTy9Iq0xG1/kThm3DoLQ77ZYWA==
Message-ID: <4B07ADD556F70043925DA2E9C5D4346D2FD8727FE6@MSXBEBVT12.planar.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[172.16.0.147]
X-Barracuda-Start-Time: 1411085050
X-Barracuda-URL: http://10.10.111.112:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at planar.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No,
	SCORE=-2.02 using per-user scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.9632
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
Subject: Is it MACHINE_GUI_CLASS or GUI_MACHINE_CLASS
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
X-List-Received-Date: Fri, 19 Sep 2014 00:04:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In my quest to understand this stuff I was checking out what the settings i=
n meta-ti/conf/machine/include/ti33x.inc do.=20

Many of the inc files in ./meta-ti/conf/machine/include set GUI_MACHINE_CLA=
SS to either bigscreen or smallscreen, but I can find no layer that uses GU=
I_MACHINE_CLASS.=20
However, meta-openembedded/meta-oe/recipes-kernel/linux/linux.inc does use =
MACHINE_GUI_CLASS to determine some sort of LOGO_SIZE variable, of course s=
mallscreen isn't one of the options.=20

So for at least my own edification what gives?=20

Thanks,
Matt S.=20


