Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by arago-project.org (Postfix) with ESMTPS id E1C0052998
	for <meta-arago@arago-project.org>;
	Wed, 15 Jan 2014 16:20:22 +0000 (UTC)
Received: from usnygrcas1.raymondcorp.local (nothing.attdns.com
	[130.1.155.194] (may be forged))
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id s0FGKHvG010389
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 15 Jan 2014 10:20:22 -0600
Received: from USNYGRMBX4.raymondcorp.local ([169.254.4.152]) by usnygrcas1
	([130.1.155.198]) with mapi id 14.03.0158.001; Wed, 15 Jan 2014 11:20:18
	-0500
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: Building the tisdk image fails to fetch php
Thread-Index: Ac8SDa017oWE3k2GRTKSnkTrc1gMQg==
Date: Wed, 15 Jan 2014 16:20:17 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622BA33E9E@USNYGRMBX4.raymondcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.150.131]
MIME-Version: 1.0
X-MessageScreenMessageID: 1389802822.245525.1642.728252463
X-MessageScreenContentScore: Score of 0 assigned to Content
X-MessageScreenUCEScore: Score of 0 assigned to UCE
X-MessageScreen: Analyzed by IntelliReach MessageScreen(tm)
Subject: Building the tisdk image fails to fetch php
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
X-List-Received-Date: Wed, 15 Jan 2014 16:20:24 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA33E9EUSNYGRMBX4raymo_"

--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA33E9EUSNYGRMBX4raymo_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is in the meta-openembeded layer but might be fixed in the master...=

I use the git://arago-project.org/git/projects/oe-layersetup.git to get r=
elease configs.

Anyway the SRC_URI is invalid for php-5.5.14 as they move them
from: http://www.php.net/distributions/php-${PV}.tar.bz2
to: http://museum.php.net/php5/php-${PV}.tar.bz2

I just changed the php.inc at /tisdk/sources/meta-openembedded/meta-oe/re=
cipes-devtools/php/php.inc

I am just learning about layers i assume there is something i could have =
done in my local.conf but have not discovered yet...

Just wanted it to be noted in case others run into the issue.

-Josh


Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.



--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA33E9EUSNYGRMBX4raymo_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-asci=
i">
</head>
<body bgcolor=3D"#FFFFFF" text=3D"#000000">
This is in the meta-openembeded layer but might be fixed in the master...=
<br>
I use the git://arago-project.org/git/projects/oe-layersetup.git to get r=
elease configs.<br>
<br>
Anyway the SRC_URI is invalid for php-5.5.14 as they move them <br>
from: <a class=3D"moz-txt-link-freetext" href=3D"http://www.php.net/distr=
ibutions/php-$">
http://www.php.net/distributions/php-$</a>{PV}.tar.bz2&nbsp; <br>
to: <a class=3D"moz-txt-link-freetext" href=3D"http://museum.php.net/php5=
/php-$">http://museum.php.net/php5/php-$</a>{PV}.tar.bz2
<br>
<br>
I just changed the php.inc at /tisdk/sources/meta-openembedded/meta-oe/re=
cipes-devtools/php/php.inc<br>
<br>
I am just learning about layers i assume there is something i could have =
done in my local.conf but have not discovered yet...<br>
<br>
Just wanted it to be noted in case others run into the issue.<br>
<br>
-Josh<br>
<p>
Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.

<p>

</body>
</html>

--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA33E9EUSNYGRMBX4raymo_--
