Return-Path: <x0038811@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 6B27A52978
	for <meta-arago@arago-project.org>;
	Wed, 13 Jun 2018 03:30:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5D3UECE025375
	for <meta-arago@arago-project.org>; Tue, 12 Jun 2018 22:30:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528860614;
	bh=Fb9mB+gsAw9/y8msGdbhEU2cPwsqz6X8lCfayeg0ooE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=W9nG5XtyqipXi9sLEKCpXrTJsbS8ag9X3RlLhEHYhMwiZe7rkRvI4Wqh502cJjjkN
	LGCm3vtfZv7WS2uSTiiPhvYdxYLxXtz7+6YUtd2zG2XoEqgO4A3jc12XK+MIbNcKSM
	QLE4GA21P+toSsKNIRMhYOqCeU5lGINc6zZ15OZM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5D3UEq5002071
	for <meta-arago@arago-project.org>; Tue, 12 Jun 2018 22:30:14 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 12 Jun 2018 22:30:14 -0500
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
	DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
	15.01.1466.003; Tue, 12 Jun 2018 22:30:14 -0500
From: "Prasad, Ram" <x0038811@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko V2 0/2] gstreamer 1.12 patches
Thread-Index: AQHUAggosbq3iTfsVk6KOf8dEophDKRderwAgAANjtA=
Date: Wed, 13 Jun 2018 03:30:14 +0000
Message-ID: <14bb9e4323dd412485ea202cefbf9084@ti.com>
References: <1528778710-2395-1-git-send-email-x0038811@ti.com>
	<20180612213658.GB5417@beryl>
In-Reply-To: <20180612213658.GB5417@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.145.0]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko V2 0/2] gstreamer 1.12 patches
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
X-List-Received-Date: Wed, 13 Jun 2018 03:30:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,
I updated meta-arago commit-messages in V2 with proper wordings so that it =
clearly tells what has changed. This is the only change wrt V1

Thanks
Ramprasad

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, June 13, 2018 3:07 AM
To: Prasad, Ram
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [rocko V2 0/2] gstreamer 1.12 patches

Sorry for the delay.
What are the differences from v1?


On Tue, Jun 12, 2018 at 10:15:08AM +0530, Ramprasad N wrote:
> Update SRCREV of gst-vpe and gst-ducati with latest commits
>=20
> Ramprasad N (2):
>   gstvpe: Bump SRCREV with latest fixes
>   gst-ducati: Update SRCREV with latest commit
>=20
>  .../gstreamer1.0-plugins-ducati_git.bb             |  4 +--
>  ...late-the-output-structure-with-progressiv.patch | 33 ----------------=
------
>  .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |  5 ++--
>  3 files changed, 4 insertions(+), 38 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/g=
streamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-prog=
ressiv.patch
>=20
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

