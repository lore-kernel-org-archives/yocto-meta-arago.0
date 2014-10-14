Return-Path: <btv1==364a9978175==Matt.Schuckmann@planar.com>
Received: from barbvt10.planar.com (mail.planar.com [199.244.172.52])
	by arago-project.org (Postfix) with ESMTP id F1AD852A39
	for <meta-arago@arago-project.org>;
	Tue, 14 Oct 2014 17:48:27 +0000 (UTC)
X-ASG-Debug-ID: 1413308903-04b02b6fa5e9b10001-NloGV9
Received: from msxbvt03.planar.net ([172.16.0.147]) by barbvt10.planar.com
	with ESMTP id IkzZBIT2pNQAakcZ for <meta-arago@arago-project.org>;
	Tue, 14 Oct 2014 10:48:23 -0700 (PDT)
X-Barracuda-Envelope-From: Matt.Schuckmann@planar.com
Received: from MSXBEBVT12.planar.net ([::1]) by msxbvt03.planar.net ([::1])
	with mapi; Tue, 14 Oct 2014 10:48:23 -0700
From: Matt Schuckmann <Matt.Schuckmann@planar.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Date: Tue, 14 Oct 2014 10:48:21 -0700
Thread-Topic: Arago dependency on qt
X-ASG-Orig-Subj: Arago dependency on qt
Thread-Index: Ac/n1wujHTHQZ+PaQMS1PTIo7Gv+9A==
Message-ID: <4B07ADD556F70043925DA2E9C5D4346D2FD87996D4@MSXBEBVT12.planar.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[172.16.0.147]
X-Barracuda-Start-Time: 1413308903
X-Barracuda-URL: http://10.10.111.112:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at planar.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -1.52
X-Barracuda-Spam-Status: No,
	SCORE=-1.52 using per-user scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=WEIRD_PORT
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.10563
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	0.50 WEIRD_PORT URI: Uses non-standard port number for HTTP
Subject: Arago dependency on qt
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
X-List-Received-Date: Tue, 14 Oct 2014 17:48:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm creating a new layer with a distro and image based on Arago.=20

The target image will have no graphics support so I don't want to included =
the qt layer in my bblayers.conf file however if I remove it I get the foll=
owing error:

ERROR: ParseError at /home/dev/builds/zanzibar/tisdk2/sources/meta-arago/me=
ta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb:1: Could not inclu=
de required file recipes-qt/qt5/qt5-5.1.1.inc
ERROR: Command execution failed: Exited with 1

So it looks like something in Arago is forcing the inclusion of qt support =
even though I'm not referencing qt anywhere in my layer.=20

Can anyone help me understand what is going on?=20

Thanks,
Matt S.=20

