Return-Path: <brad@evidence.com>
Received: from email.taser.com (email.taser.com [74.206.119.92])
	by arago-project.org (Postfix) with ESMTP id AC9BA529B5
	for <meta-arago@arago-project.org>;
	Mon, 23 Dec 2013 02:20:34 +0000 (UTC)
X-ASG-Debug-ID: 1387765232-0499bf1df41e5d0001-NloGV9
Received: from MAGNI.atmoss (magni.atmoss [10.10.20.112]) by email.taser.com
	with ESMTP id RBTlVwy0Vs9oV1sr for <meta-arago@arago-project.org>;
	Sun, 22 Dec 2013 19:20:32 -0700 (MST)
X-Barracuda-Envelope-From: brad@evidence.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.20.112
Received: from TI-ODIN.tasernet.com (172.16.1.112) by email.taser.com
	(10.10.20.112) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 22 Dec 2013 19:20:32 -0700
Received: from TI-THOR.tasernet.com ([fe80::7c49:ae21:6650:2789]) by
	TI-ODIN.tasernet.com ([fe80::64ff:7320:e6e7:27c8%20]) with mapi id
	14.02.0347.000; Sun, 22 Dec 2013 19:20:31 -0700
X-Barracuda-RBL-Trusted-Forwarder: 10.10.20.112
From: Brad Litterell <brad@evidence.com>
X-Barracuda-BWL-IP: fe80::7c49:ae21:6650:2789
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: BB_NO_NETWORK failure with arago
X-ASG-Orig-Subj: BB_NO_NETWORK failure with arago
Thread-Index: Ac7/hY1ku6Vs4nlyQcSO6dfw2y/QAA==
Date: Mon, 23 Dec 2013 02:20:30 +0000
Message-ID: <E51394554A503C4E852F9BEE46B03E8D019AE6C5@TI-THOR.tasernet.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.1.103]
MIME-Version: 1.0
X-Barracuda-Connect: magni.atmoss[10.10.20.112]
X-Barracuda-Start-Time: 1387765232
X-Barracuda-URL: http://10.10.20.59:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at taser.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=HTML_MESSAGE
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.2.143316
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	0.00 HTML_MESSAGE           BODY: HTML included in message
Subject: BB_NO_NETWORK failure with arago
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
X-List-Received-Date: Mon, 23 Dec 2013 02:20:35 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_E51394554A503C4E852F9BEE46B03E8D019AE6C5TITHORtasernetc_"

--_000_E51394554A503C4E852F9BEE46B03E8D019AE6C5TITHORtasernetc_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I am having trouble getting my build environment to work offline.  I follow=
ed the instructions here:
https://wiki.yoctoproject.org/wiki/How_do_I#Q:_How_do_I_create_my_own_sourc=
e_download_mirror_.3F

I've built my project, created the tarballs, etc.  However, it appears ther=
e is still something I'm missing.  When I enable BB_NO_NETWORK, I get an er=
ror here:

$ bitbake base-files
...
Loaded 57 entries from dependency cache.
NOTE: Error during finalise of /home/brad/etm2/sources/meta-arago/meta-arag=
o-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb
ERROR: ExpansionError during parsing /home/brad/etm2/sources/meta-arago/met=
a-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb: Failure expa=
nding variable S: ExpansionError: Failure expanding variable SRCPV, express=
ion was ${@bb.fetch2.get_srcrev(d)} which triggered exception NetworkAccess=
: Network access disabled through BB_NO_NETWORK but access requested with c=
ommand git ls-remote git://arago-project.org/git/projects/test-automation/l=
tp-ddt.git master (for url None)
ERROR: Command execution failed: Exited with 1

In this case, the SRC_URI looks like this:

SRCREV =3D "5fba3d42f126ce13333fb7d0412d729b753ee5a4"
BRANCH ?=3D "master"
SRC_URI =3D "git://arago-project.org/git/projects/test-automation/ltp-ddt.g=
it;protocol=3Dgit;branch=3D${BRANCH}"

So, I figured apply  the same fix as mentioned on the Wiki:

SRCREV =3D "5fba3d42f126ce13333fb7d0412d729b753ee5a4"
#BRANCH ?=3D "master"
#SRC_URI =3D "git://arago-project.org/git/projects/test-automation/ltp-ddt.=
git;protocol=3Dgit;branch=3D${BRANCH}"
SRC_URI =3D "git://arago-project.org/git/projects/test-automation/ltp-ddt.g=
it;protocol=3Dgit"

But I get the same error?  And I'm not even using ltp-ddt...

Is there something I'm missing in setting up BB_NO_NETWORK? Is there someth=
ing extra required for the arago project to run with no network?

Thanks,
Brad

--_000_E51394554A503C4E852F9BEE46B03E8D019AE6C5TITHORtasernetc_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" id=3D"owaParaStyle"></style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">
<div>
<div>I am having trouble getting my build environment to work offline. &nbs=
p;I followed the instructions here:</div>
<div><a href=3D"https://wiki.yoctoproject.org/wiki/How_do_I#Q:_How_do_I_cre=
ate_my_own_source_download_mirror_.3F" target=3D"_blank">https://wiki.yocto=
project.org/wiki/How_do_I#Q:_How_do_I_create_my_own_source_download_mirror_=
.3F</a></div>
<div><br>
</div>
<div>I've built my project, created the tarballs, etc. &nbsp;However, it ap=
pears there is still something I'm missing. &nbsp;When I enable BB_NO_NETWO=
RK, I get an error here:</div>
<div><br>
</div>
<div>$ bitbake base-files</div>
<div>...</div>
<div>Loaded 57 entries from dependency cache.</div>
<div>NOTE: Error during finalise of /home/brad/etm2/sources/meta-arago/meta=
-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb</div>
<div>ERROR: ExpansionError during parsing /home/brad/etm2/sources/meta-arag=
o/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb: Failure=
 expanding variable S: ExpansionError: Failure expanding variable SRCPV, ex=
pression was ${@bb.fetch2.get_srcrev(d)}
 which triggered exception NetworkAccess: Network access disabled through B=
B_NO_NETWORK but access requested with command git ls-remote git://arago-pr=
oject.org/git/projects/test-automation/ltp-ddt.git master (for url None)</d=
iv>
<div>ERROR: Command execution failed: Exited with 1</div>
</div>
<div><br>
</div>
<div>In this case, the SRC_URI looks like this:</div>
<div>
<div><br>
</div>
<div>SRCREV =3D &quot;5fba3d42f126ce13333fb7d0412d729b753ee5a4&quot;</div>
<div>BRANCH ?=3D &quot;master&quot;</div>
<div>SRC_URI =3D &quot;git://arago-project.org/git/projects/test-automation=
/ltp-ddt.git;protocol=3Dgit;branch=3D${BRANCH}&quot;</div>
</div>
<div><br>
</div>
<div>So, I figured apply &nbsp;the same fix as mentioned on the Wiki:</div>
<div><br>
</div>
<div>
<div>SRCREV =3D &quot;5fba3d42f126ce13333fb7d0412d729b753ee5a4&quot;</div>
<div>#BRANCH ?=3D &quot;master&quot;</div>
<div>#SRC_URI =3D &quot;git://arago-project.org/git/projects/test-automatio=
n/ltp-ddt.git;protocol=3Dgit;branch=3D${BRANCH}&quot;</div>
</div>
<div>SRC_URI =3D &quot;git://arago-project.org/git/projects/test-automation=
/ltp-ddt.git;protocol=3Dgit&quot;</div>
<div><br>
</div>
<div>But I get the same error? &nbsp;And I'm not even using ltp-ddt...</div=
>
<div><br>
</div>
<div>Is there something I'm missing in setting up BB_NO_NETWORK? Is there s=
omething extra required for the arago project to run with no network?</div>
<div><br>
</div>
<div>Thanks,</div>
<div>Brad</div>
</div>
</body>
</html>

--_000_E51394554A503C4E852F9BEE46B03E8D019AE6C5TITHORtasernetc_--
