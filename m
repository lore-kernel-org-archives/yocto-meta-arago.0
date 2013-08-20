Return-Path: <bradl@taser.com>
Received: from email.taser.com (email.taser.com [74.206.119.92])
	by arago-project.org (Postfix) with ESMTP id 3F0D05299B
	for <meta-arago@arago-project.org>;
	Tue, 20 Aug 2013 22:14:36 +0000 (UTC)
X-ASG-Debug-ID: 1377036873-0499bf377207b10001-NloGV9
Received: from LOKI.atmoss (loki.atmoss [10.10.20.113]) by email.taser.com
	with ESMTP id ssi3gO07sZqFBSIs for <meta-arago@arago-project.org>;
	Tue, 20 Aug 2013 15:14:33 -0700 (MST)
X-Barracuda-Envelope-From: bradl@taser.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.20.113
Received: from TI-THOR.tasernet.com (172.16.1.113) by email.taser.com
	(10.10.20.113) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 20 Aug 2013 15:14:33 -0700
Received: from TI-ODIN.tasernet.com ([fe80::64ff:7320:e6e7:27c8]) by
	TI-THOR.tasernet.com ([fe80::7c49:ae21:6650:2789%22]) with mapi id
	14.02.0342.003; Tue, 20 Aug 2013 15:14:32 -0700
X-Barracuda-RBL-Trusted-Forwarder: 10.10.20.113
From: Brad Litterell <bradl@taser.com>
X-Barracuda-BWL-IP: fe80::64ff:7320:e6e7:27c8
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: How to run Arago in QEMU?
X-ASG-Orig-Subj: How to run Arago in QEMU?
Thread-Index: AQHOnfKlfDIqHulCY0m4RVa7IBNufA==
Date: Tue, 20 Aug 2013 22:14:32 +0000
Message-ID: <5681790B-56AE-40FB-8B03-1127F3107B0E@taser.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.1.103]
MIME-Version: 1.0
X-Barracuda-Connect: loki.atmoss[10.10.20.113]
X-Barracuda-Start-Time: 1377036873
X-Barracuda-URL: http://10.10.20.59:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at taser.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=HTML_MESSAGE
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.2.138944
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	0.00 HTML_MESSAGE           BODY: HTML included in message
Subject: How to run Arago in QEMU?
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
X-List-Received-Date: Tue, 20 Aug 2013 22:14:36 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_5681790B56AE40FB8B031127F3107B0Etasercom_"

--_000_5681790B56AE40FB8B031127F3107B0Etasercom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

HI,

I downloaded the Arago system and successfully built an image for am335x-ev=
m, but I want to create an image I can run in QEMU.

When I change my local.conf file from:


MACHINE =3D "am335x-evm"


to


MACHINE=3D"qemuarm"


I receive this error:

ERROR:  OE-core's config sanity checker detected a potential misconfigurati=
on.
    Either fix the cause of this error or at your own risk disable the chec=
ker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Error, the PACKAGE_ARCHS (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-cor=
texa8thf-neon} qemuarm) variable does not contain TUNE_PKGARCH (armv5).Tool=
chain tunings invalid:
Tuning 'cortexa8thf-neon' has no defined features, and cannot be used.

ERROR: Execution of event handler 'check_sanity_eventhandler' failed

I don't understand how the tunings work, so I'm completely stumped about ho=
w to run my image in QEMU.

Are there any instructions for building & running Arago under QEMU?

Thanks,
Brad


--_000_5681790B56AE40FB8B031127F3107B0Etasercom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <9E023690E0D6C44D866FC69310B525D3@taser.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-lin=
e-break: after-white-space; ">
HI,
<div><br>
</div>
<div>I downloaded the Arago system and successfully built an image for am33=
5x-evm, but I want to create an image I can run in QEMU. &nbsp;</div>
<div><br>
</div>
<div>When I change my local.conf file from:</div>
<div>
<pre style=3D"margin-top: 0px; margin-bottom: 0px; "><span style=3D" color:=
#008000;"><br></span></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px; "><span style=3D" color:=
#008000;">MACHINE</span><span style=3D" color:#c0c0c0;"> </span><span style=
=3D" color:#008000;">=3D</span><span style=3D" color:#c0c0c0;"> </span><spa=
n style=3D" color:#008000;">&quot;am335x-evm&quot;</span></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px; "><br></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px; ">to&nbsp;</pre>
</div>
<div>
<pre style=3D"margin-top: 0px; margin-bottom: 0px; "><br></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px; "><!--StartFragment-->MA=
CHINE=3D&quot;qemuarm&quot;</pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px; "><br></pre>
</div>
<div>I receive this error:</div>
<div><br>
</div>
<div>
<div>ERROR: &nbsp;OE-core's config sanity checker detected a potential misc=
onfiguration.</div>
<div>&nbsp; &nbsp; Either fix the cause of this error or at your own risk d=
isable the checker (see sanity.conf).</div>
<div>&nbsp; &nbsp; Following is the list of potential problems / advisories=
:</div>
<div><br>
</div>
<div>&nbsp; &nbsp; Error, the PACKAGE_ARCHS (all any noarch ${PACKAGE_EXTRA=
_ARCHS_tune-cortexa8thf-neon} qemuarm) variable does not contain TUNE_PKGAR=
CH (armv5).Toolchain tunings invalid:</div>
<div>Tuning 'cortexa8thf-neon' has no defined features, and cannot be used.=
</div>
<div><br>
</div>
<div>ERROR: Execution of event handler 'check_sanity_eventhandler' failed</=
div>
</div>
<div><br>
</div>
<div>I don't understand how the tunings work, so I'm completely stumped abo=
ut how to run my image in QEMU.&nbsp;</div>
<div><br>
</div>
<div>Are there any instructions for building &amp; running Arago under QEMU=
?</div>
<div><br>
</div>
<div>Thanks,</div>
<div>Brad</div>
<div><br>
</div>
</body>
</html>

--_000_5681790B56AE40FB8B031127F3107B0Etasercom_--
