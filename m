Return-Path: <btv1==3195c5a2816==Matt.Schuckmann@planar.com>
Received: from barbvt11.planar.com (mail.planar.com [199.244.172.52])
	by arago-project.org (Postfix) with ESMTP id 3616352A3B
	for <meta-arago@arago-project.org>;
	Sat, 30 Aug 2014 00:31:08 +0000 (UTC)
X-ASG-Debug-ID: 1409358663-04afd2135f265120001-NloGV9
Received: from msxbvt03.planar.net (msxbvt03.planar.net [172.16.0.147]) by
	barbvt11.planar.com with ESMTP id 2MuR17o3QHF8X5km for
	<meta-arago@arago-project.org>; Fri, 29 Aug 2014 17:31:03 -0700 (PDT)
X-Barracuda-Envelope-From: Matt.Schuckmann@planar.com
Received: from MSXBEBVT12.planar.net ([::1]) by msxbvt03.planar.net ([::1])
	with mapi; Fri, 29 Aug 2014 17:31:03 -0700
From: Matt Schuckmann <Matt.Schuckmann@planar.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Date: Fri, 29 Aug 2014 17:31:02 -0700
Thread-Topic: I'm confused about distributions, machines, and images
X-ASG-Orig-Subj: I'm confused about distributions, machines, and images
Thread-Index: Ac/D6a2btFyB6NMVRt6mxPkJxMeDaA==
Message-ID: <4B07ADD556F70043925DA2E9C5D4346D2FD86C6135@MSXBEBVT12.planar.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Barracuda-Connect: msxbvt03.planar.net[172.16.0.147]
X-Barracuda-Start-Time: 1409358663
X-Barracuda-URL: http://10.10.111.113:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at planar.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.4998 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No,
	SCORE=0.00 using per-user scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.8971
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
Subject: I'm confused about distributions, machines, and images
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
X-List-Received-Date: Sat, 30 Aug 2014 00:31:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I feel like I keep going around in circles on this and I'm looking for some=
 wisdom and direction. I hope that I am posting this in the correct place.

I'm trying to get a Linux image setup for my custom board based on the AM33=
5x.
I assume that I want to use the meta-arago layer because it has all the lat=
est tested stuff. Correct?

Our board will not have any sound, screen, usbgadget, or video support so I=
 assume that I'll want to create a new MACHINE, probably based on meta-arag=
o/meta-arago-distro/conf/machine/arago-armv7.conf (correct?) but with a dif=
ferent definition for MACHINE_FEATURES. Is this the correct thing to do? Do=
 I start with a completely scratch machine definition coping bits and piece=
s from the arago machine definitions, or do somehow inherit or include the =
definitions from the arago files and somehow override or filter out stuff t=
hat I don't want?

Next, I don't understand if I need to create a new distribution. It doesn't=
 seem like I should, but I can see that meta-argo/meta-argo-distro/conf/dis=
tro/arago.conf defines DISTRO_FEATURES to include many things that my syste=
m won't need, including alsa, pcmcia, usbgadget, wifi, etc. I can't seem to=
 find a complete description for what DISTRO_FEATURES does (same goes for M=
ACHINE_FEATURES and IMAGE_FEATURES), does it mean that all of the things li=
sted will be included in images based on the distribution or? Ultimately th=
e question is: do I need to create a new distribution? And if I do how best=
 to go about it.

Finally, I think that I need to create a new image that only includes the p=
ackages that I want, I would think that I would want to base it on one of t=
he arago images (i.e. include something like arago-base-image.bb in my imag=
e). However when I look at arago-base-image.bb I see that it includes packa=
gegroup-arago-base which RDEPENDS on alsa-lib and alsa-utils-aplay both of =
which I don't think are needed since my board doesn't support sound. Does t=
his mean that I shouldn't base my image on an arago-base-image or is there =
a way to filter these packages out?=20

I really appreciate any help, and I really need some direction, I feel like=
 I'm starting to learn how to get around the open-embedded stack but there =
is still a lot that I have to learn.=20

Matt S.=20

