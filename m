Return-Path: <btv1==33888e39b36==Matt.Schuckmann@planar.com>
Received: from barbvt11.planar.com (mail.planar.com [199.244.172.52])
	by arago-project.org (Postfix) with ESMTP id B221F5298D
	for <meta-arago@arago-project.org>;
	Thu, 18 Sep 2014 21:02:27 +0000 (UTC)
X-ASG-Debug-ID: 1411074145-04afd2135f91f970001-NloGV9
Received: from msxbvt03.planar.net (msxbvt03.planar.net [172.16.0.147]) by
	barbvt11.planar.com with ESMTP id 1VUJaLFsavV0YnT7 for
	<meta-arago@arago-project.org>; Thu, 18 Sep 2014 14:02:25 -0700 (PDT)
X-Barracuda-Envelope-From: Matt.Schuckmann@planar.com
Received: from MSXBEBVT12.planar.net ([::1]) by msxbvt03.planar.net ([::1])
	with mapi; Thu, 18 Sep 2014 14:02:25 -0700
From: Matt Schuckmann <Matt.Schuckmann@planar.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Date: Thu, 18 Sep 2014 14:02:24 -0700
Thread-Topic: Arago build fails if building srcipk is disabled
X-ASG-Orig-Subj: Arago build fails if building srcipk is disabled
Thread-Index: Ac/Tg9hV8S3+HpktQnWrE2QbV99qEw==
Message-ID: <4B07ADD556F70043925DA2E9C5D4346D2FD8727FA1@MSXBEBVT12.planar.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Barracuda-Connect: msxbvt03.planar.net[172.16.0.147]
X-Barracuda-Start-Time: 1411074145
X-Barracuda-URL: http://10.10.111.113:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at planar.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.4167 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No,
	SCORE=0.00 using per-user scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.9627
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
Subject: Arago build fails if building srcipk is disabled
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
X-List-Received-Date: Thu, 18 Sep 2014 21:02:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've been chasing this for a bit and I think I've almost got it figured out=
.=20
I've been trying to create a new DISTRO based on Arago and I keep getting t=
he following error.=20

/home/dev/builds/zanzibar/tisdk/build/arago-tmp-external-linaro-toolchain/w=
ork/zanziboard-oe-linux-gnueabi/linux-ti-staging/3.14.17-r22e+gitrAUTOINC+1=
ef37cd35d-arago1/temp/run.do_compile.28819: line 105: sourceipk_do_create_s=
rcipk: command not found

I finally figured out that if I included arago-source-ipk.conf in my DISTRO=
 file the error goes away.=20
My understanding is that arago-source-ipk.conf turns on creating srcipk pac=
kages for all the packages included in the SDK. I'm not interested in creat=
ing srcipk's (at least I don't think I am) since I'm not trying to create a=
n SDK I just want a deployable image.=20

Digging a little deeper I found that meta-arago-distro/recipes-kernel/linux=
/copy-defconfig.inc calls sourceipk_do_create_srcipk in a do_compile_prepen=
d() function to pick up any changes to the configuration file and then rebu=
ild the srcipk.=20

I think that the do_compile_prepend() function should test the value of one=
 of the CREATE_SRCIPK_* variables before it tries to call sourceipk_do_crea=
te_srcipk, I'm just not sure which one.=20
I'm guessing maybe CREATE_SRCIPK_pn-linux-ti-staging but I'm not sure or ma=
ybe it should test multiple variables?=20

I'd appreciate any guidance.=20

Thanks,
Matt S.=20

