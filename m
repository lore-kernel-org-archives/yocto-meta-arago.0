Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 980E45296F
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 12:52:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r92CqvaI014107;
	Wed, 2 Oct 2013 07:52:57 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92Cqvkt011699;
	Wed, 2 Oct 2013 07:52:57 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 2 Oct 2013 07:52:57 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 01/13] arago-dylan-config: add
	meta-qt5/master and dependency on meta-ruby from meta-oe
Thread-Index: AQHOvnWBoGgYcp4cLEmbhF83239hm5nhX3bg
Date: Wed, 2 Oct 2013 12:52:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015977A49C@DLEE11.ent.ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-2-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 01/13] arago-dylan-config: add meta-qt5/master and dependency on meta-ruby from meta-oe
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
X-List-Received-Date: Wed, 02 Oct 2013 12:52:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, October 01, 2013 2:11 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 01/13] arago-dylan-config: add meta-
>qt5/master and dependency on meta-ruby from meta-oe
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> configs/arago-dylan-config.txt | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/configs/arago-dylan-config.txt b/configs/arago-dylan-
>config.txt
>index 59055bd..f5fb666 100644
>--- a/configs/arago-dylan-config.txt
>+++ b/configs/arago-dylan-config.txt
>@@ -3,7 +3,8 @@
>
>
>bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912f
>f3b87379bf629066f6662458,layers=3D
> meta-arago,git://arago-project.org/git/meta-
>arago.git,master,HEAD,layers=3Dmeta-arago-distro:meta-arago-extras
>-meta-openembedded,git://git.openembedded.org/meta-
>openembedded,dylan,HEAD,layers=3Dtoolchain-layer:meta-
>networking:meta-oe
>+meta-qt5,git://github.com/meta-qt5/meta-
>qt5.git,master,HEAD,layers=3D
>+meta-openembedded,git://git.openembedded.org/meta-
>openembedded,dylan,HEAD,layers=3Dtoolchain-layer:meta-
>networking:meta-ruby:meta-oe
> meta-ti,git://arago-project.org/git/meta-
>ti.git,dylan,HEAD,layers=3D
> meta-linaro,git://git.linaro.org/openembedded/meta-
>linaro.git,dylan,HEAD,layers=3Dmeta-linaro-toolchain
> oe-core,git://git.openembedded.org/openembedded-
>core,dylan,HEAD,layers=3Dmeta
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

