Return-Path: <bradl@taser.com>
Received: from email.taser.com (email.taser.com [74.206.119.92])
	by arago-project.org (Postfix) with ESMTP id CD15B529DA
	for <meta-arago@arago-project.org>;
	Tue, 20 Aug 2013 23:18:09 +0000 (UTC)
X-ASG-Debug-ID: 1377040687-0499bf377208e90001-NloGV9
Received: from MAGNI.atmoss (magni.atmoss [10.10.20.112]) by email.taser.com
	with ESMTP id hTaAFxxateNWk6oX; Tue, 20 Aug 2013 16:18:07 -0700 (MST)
X-Barracuda-Envelope-From: bradl@taser.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.20.112
Received: from TI-THOR.tasernet.com (172.16.1.113) by email.taser.com
	(10.10.20.112) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 20 Aug 2013 16:18:07 -0700
Received: from TI-ODIN.tasernet.com ([fe80::64ff:7320:e6e7:27c8]) by
	TI-THOR.tasernet.com ([fe80::7c49:ae21:6650:2789%22]) with mapi id
	14.02.0342.003; Tue, 20 Aug 2013 16:18:06 -0700
X-Barracuda-RBL-Trusted-Forwarder: 10.10.20.112
From: Brad Litterell <bradl@taser.com>
X-Barracuda-BWL-IP: fe80::64ff:7320:e6e7:27c8
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-arago] How to run Arago in QEMU?
X-ASG-Orig-Subj: Re: [meta-arago] How to run Arago in QEMU?
Thread-Index: AQHOnfKlfDIqHulCY0m4RVa7IBNufJmfIWoAgAAPFYA=
Date: Tue, 20 Aug 2013 23:18:05 +0000
Message-ID: <B792B041-567C-426A-AD0E-AD6C90F3FB85@taser.com>
References: <5681790B-56AE-40FB-8B03-1127F3107B0E@taser.com>
	<20130820222406.GI8481@edge>
In-Reply-To: <20130820222406.GI8481@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.1.103]
MIME-Version: 1.0
X-Barracuda-Connect: magni.atmoss[10.10.20.112]
X-Barracuda-Start-Time: 1377040687
X-Barracuda-URL: http://10.10.20.59:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at taser.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=HTML_MESSAGE
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.2.138950
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	0.00 HTML_MESSAGE           BODY: HTML included in message
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: How to run Arago in QEMU?
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
X-List-Received-Date: Tue, 20 Aug 2013 23:18:10 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B792B041567C426AAD0EAD6C90F3FB85tasercom_"

--_000_B792B041567C426AAD0EAD6C90F3FB85tasercom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Thanks for reply, but I'm afraid I have another question:  I am using the L=
inaro toolchain recommended here: http://arago-project.org/wiki/index.php/S=
etting_Up_Build_Environment

Do I correctly understand the A8 optimizations are coming from that toolcha=
in?

If those optimizations are not supported under QEMU, should I be using a di=
fferent toolchain for the emulator?


On Aug 20, 2013, at 3:24 PM, Denys Dmytriyenko <denys@ti.com<mailto:denys@t=
i.com>> wrote:

On Tue, Aug 20, 2013 at 10:14:32PM +0000, Brad Litterell wrote:
HI,

I downloaded the Arago system and successfully built an image for
am335x-evm, but I want to create an image I can run in QEMU.

When I change my local.conf file from:


MACHINE =3D "am335x-evm"


to


MACHINE=3D"qemuarm"

I believe you should be able to run it under quemu w/o changing the MACHINE=
...


I receive this error:

ERROR:  OE-core's config sanity checker detected a potential misconfigurati=
on.
   Either fix the cause of this error or at your own risk disable the check=
er (see sanity.conf).
   Following is the list of potential problems / advisories:

   Error, the PACKAGE_ARCHS (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-cort=
exa8thf-neon} qemuarm) variable does not contain TUNE_PKGARCH (armv5).Toolc=
hain tunings invalid:
Tuning 'cortexa8thf-neon' has no defined features, and cannot be used.

You are trying to build using Cortex-A8 specific optimizations, while
"qemuarm" machine does not support them. Those optimizations are being set =
in
conf/distro/include/toolchain-linaro.inc

--
Denys


ERROR: Execution of event handler 'check_sanity_eventhandler' failed

I don't understand how the tunings work, so I'm completely stumped about ho=
w to run my image in QEMU.

Are there any instructions for building & running Arago under QEMU?

Thanks,
Brad


_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago



--_000_B792B041567C426AAD0EAD6C90F3FB85tasercom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <66318D69366F3C44B9DFEC9C9DE282ED@taser.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-lin=
e-break: after-white-space; ">
Hi Denys,
<div><br>
</div>
<div>Thanks for reply, but I'm afraid I have another question: &nbsp;I am u=
sing the Linaro toolchain recommended here:&nbsp;<a href=3D"http://arago-pr=
oject.org/wiki/index.php/Setting_Up_Build_Environment">http://arago-project=
.org/wiki/index.php/Setting_Up_Build_Environment</a></div>
<div><br>
</div>
<div>Do I correctly understand the A8 optimizations are coming from that to=
olchain?</div>
<div><br>
</div>
<div>If those optimizations are not supported under QEMU, should I be using=
 a different toolchain for the emulator?</div>
<div><br>
</div>
<div><br>
</div>
<div>
<div>
<div>On Aug 20, 2013, at 3:24 PM, Denys Dmytriyenko &lt;<a href=3D"mailto:d=
enys@ti.com">denys@ti.com</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<blockquote type=3D"cite">On Tue, Aug 20, 2013 at 10:14:32PM &#43;0000, Bra=
d Litterell wrote:<br>
<blockquote type=3D"cite">HI,<br>
<br>
I downloaded the Arago system and successfully built an image for <br>
am335x-evm, but I want to create an image I can run in QEMU.<br>
<br>
When I change my local.conf file from:<br>
<br>
<br>
MACHINE =3D &quot;am335x-evm&quot;<br>
<br>
<br>
to<br>
<br>
<br>
MACHINE=3D&quot;qemuarm&quot;<br>
</blockquote>
<br>
I believe you should be able to run it under quemu w/o changing the MACHINE=
...<br>
<br>
<br>
<blockquote type=3D"cite">I receive this error:<br>
<br>
ERROR: &nbsp;OE-core's config sanity checker detected a potential misconfig=
uration.<br>
&nbsp;&nbsp;&nbsp;Either fix the cause of this error or at your own risk di=
sable the checker (see sanity.conf).<br>
&nbsp;&nbsp;&nbsp;Following is the list of potential problems / advisories:=
<br>
<br>
&nbsp;&nbsp;&nbsp;Error, the PACKAGE_ARCHS (all any noarch ${PACKAGE_EXTRA_=
ARCHS_tune-cortexa8thf-neon} qemuarm) variable does not contain TUNE_PKGARC=
H (armv5).Toolchain tunings invalid:<br>
Tuning 'cortexa8thf-neon' has no defined features, and cannot be used.<br>
</blockquote>
<br>
You are trying to build using Cortex-A8 specific optimizations, while <br>
&quot;qemuarm&quot; machine does not support them. Those optimizations are =
being set in <br>
conf/distro/include/toolchain-linaro.inc<br>
<br>
-- <br>
Denys<br>
<br>
<br>
<blockquote type=3D"cite">ERROR: Execution of event handler 'check_sanity_e=
venthandler' failed<br>
<br>
I don't understand how the tunings work, so I'm completely stumped about ho=
w to run my image in QEMU.<br>
<br>
Are there any instructions for building &amp; running Arago under QEMU?<br>
<br>
Thanks,<br>
Brad<br>
<br>
</blockquote>
<br>
<blockquote type=3D"cite">_______________________________________________<b=
r>
meta-arago mailing list<br>
<a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-project.or=
g</a><br>
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago<br>
</blockquote>
<br>
</blockquote>
</div>
<br>
</div>
</body>
</html>

--_000_B792B041567C426AAD0EAD6C90F3FB85tasercom_--
