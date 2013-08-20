Return-Path: <bradl@taser.com>
Received: from email.taser.com (email.taser.com [74.206.119.92])
	by arago-project.org (Postfix) with ESMTP id 72DC5529FE
	for <meta-arago@arago-project.org>;
	Tue, 20 Aug 2013 23:34:20 +0000 (UTC)
X-ASG-Debug-ID: 1377041659-0499bf377309270001-NloGV9
Received: from LOKI.atmoss (loki.atmoss [10.10.20.113]) by email.taser.com
	with ESMTP id H0y8Rv26mm68FaP3; Tue, 20 Aug 2013 16:34:19 -0700 (MST)
X-Barracuda-Envelope-From: bradl@taser.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.20.113
Received: from TI-THOR.tasernet.com (172.16.1.113) by email.taser.com
	(10.10.20.113) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 20 Aug 2013 16:34:19 -0700
Received: from TI-ODIN.tasernet.com ([fe80::64ff:7320:e6e7:27c8]) by
	TI-THOR.tasernet.com ([fe80::7c49:ae21:6650:2789%22]) with mapi id
	14.02.0342.003; Tue, 20 Aug 2013 16:34:18 -0700
X-Barracuda-RBL-Trusted-Forwarder: 10.10.20.113
From: Brad Litterell <bradl@taser.com>
X-Barracuda-BWL-IP: fe80::64ff:7320:e6e7:27c8
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-arago] How to run Arago in QEMU?
X-ASG-Orig-Subj: Re: [meta-arago] How to run Arago in QEMU?
Thread-Index: AQHOnfKlfDIqHulCY0m4RVa7IBNufJmfIWoAgAATnIA=
Date: Tue, 20 Aug 2013 23:34:17 +0000
Message-ID: <8B0C407B-BEC3-42C3-A9A9-9D881900CE7D@taser.com>
References: <5681790B-56AE-40FB-8B03-1127F3107B0E@taser.com>
	<20130820222406.GI8481@edge>
In-Reply-To: <20130820222406.GI8481@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.1.103]
MIME-Version: 1.0
X-Barracuda-Connect: loki.atmoss[10.10.20.113]
X-Barracuda-Start-Time: 1377041659
X-Barracuda-URL: http://10.10.20.59:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at taser.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.2.138950
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
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
X-List-Received-Date: Tue, 20 Aug 2013 23:34:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C48E3BF4F20BE94584660D4D35554E61@taser.com>
Content-Transfer-Encoding: quoted-printable

Hi Denys,

2nd question: =20

I tried running QEMU and the AM335 seems to use a load address that doesn't=
 work with QEMU:

$ qemu-system-arm -machine vexpress-a9  -kernel ~/e2/build/arago-tmp-extern=
al-linaro-toolchain/deploy/images/uImage=20
qemu: fatal: Trying to execute code outside RAM or ROM at 0x80008000

R00=3D00000000 R01=3D000008e0 R02=3D60000100 R03=3D00000000
R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
R12=3D00000000 R13=3D00000000 R14=3D00000000 R15=3D80008000
PSR=3D400001d3 -Z-- A svc32
Aborted (core dumped)

Thanks,
Brad

On Aug 20, 2013, at 3:24 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Tue, Aug 20, 2013 at 10:14:32PM +0000, Brad Litterell wrote:
>> HI,
>>=20
>> I downloaded the Arago system and successfully built an image for=20
>> am335x-evm, but I want to create an image I can run in QEMU.
>>=20
>> When I change my local.conf file from:
>>=20
>>=20
>> MACHINE =3D "am335x-evm"
>>=20
>>=20
>> to
>>=20
>>=20
>> MACHINE=3D"qemuarm"
>=20
> I believe you should be able to run it under quemu w/o changing the MACHI=
NE...
>=20
>=20
>> I receive this error:
>>=20
>> ERROR:  OE-core's config sanity checker detected a potential misconfigur=
ation.
>>    Either fix the cause of this error or at your own risk disable the ch=
ecker (see sanity.conf).
>>    Following is the list of potential problems / advisories:
>>=20
>>    Error, the PACKAGE_ARCHS (all any noarch ${PACKAGE_EXTRA_ARCHS_tune-c=
ortexa8thf-neon} qemuarm) variable does not contain TUNE_PKGARCH (armv5).To=
olchain tunings invalid:
>> Tuning 'cortexa8thf-neon' has no defined features, and cannot be used.
>=20
> You are trying to build using Cortex-A8 specific optimizations, while=20
> "qemuarm" machine does not support them. Those optimizations are being se=
t in=20
> conf/distro/include/toolchain-linaro.inc
>=20
> --=20
> Denys
>=20
>=20
>> ERROR: Execution of event handler 'check_sanity_eventhandler' failed
>>=20
>> I don't understand how the tunings work, so I'm completely stumped about=
 how to run my image in QEMU.
>>=20
>> Are there any instructions for building & running Arago under QEMU?
>>=20
>> Thanks,
>> Brad
>>=20
>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20


