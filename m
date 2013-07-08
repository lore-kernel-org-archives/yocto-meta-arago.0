Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CA00C52A5E
	for <meta-arago@arago-project.org>;
	Mon,  8 Jul 2013 16:38:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r68GcQ97026628
	for <meta-arago@arago-project.org>; Mon, 8 Jul 2013 11:38:26 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r68GcP7X028444
	for <meta-arago@arago-project.org>; Mon, 8 Jul 2013 11:38:25 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 8 Jul 2013 11:38:25 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH oe-setuplayer] oe-layertool-setup: Add
	warning before overwriting local.conf
Thread-Index: AQHOd7CPogXg9Y5HL0iDFnbk2Jg8nplbA7Fw
Date: Mon, 8 Jul 2013 16:38:25 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015963DBED@DLEE11.ent.ti.com>
References: <20130703054428.GA9111@ti.com>
In-Reply-To: <20130703054428.GA9111@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH oe-setuplayer] oe-layertool-setup: Add warning before overwriting local.conf
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
X-List-Received-Date: Mon, 08 Jul 2013 16:38:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Thanks for this

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Heroor, Siddharth
>Sent: Wednesday, July 03, 2013 12:44 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH oe-setuplayer] oe-layertool-setup:
>Add warning before overwriting local.conf
>
>* Its possible for the user to have already configured her setup.
>  Warn the user that we are overwriting his local.conf when
>  generating the local.conf.
>
>Signed-off-by: Siddharth Heroor <heroor@ti.com>
>---
> oe-layertool-setup.sh |    7 +++++++
> 1 files changed, 7 insertions(+), 0 deletions(-)
>
>diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
>index e8c427f..55cd174 100755
>--- a/oe-layertool-setup.sh
>+++ b/oe-layertool-setup.sh
>@@ -717,6 +717,13 @@ NOTE: You will probably want to change the
>default MACHINE setting in the
>       local.conf file to the machine you are trying to build.
>
> EOM
>+
>+    if [ -e $confdir/local.conf ]
>+    then
>+        echo "WARNING: Found existing $confdir/local.conf"
>+        echo "Saving a backup to $confdir/local.conf.bak"
>+        cp -f $confdir/local.conf $confdir/local.conf.bak
>+    fi
>
>     # First copy the template file
>     cp -f $OECORELOCALCONFPATH $confdir/local.conf
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

