Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id EB01052A9C
	for <meta-arago@arago-project.org>;
	Wed, 17 Jan 2018 15:55:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0HFtX0f009711
	for <meta-arago@arago-project.org>; Wed, 17 Jan 2018 09:55:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516204533;
	bh=x8+uII+gbeW0jgx24sXPBy/vEpU+XWrDJgNoMM3Hsio=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=nmr+eRmwBn33lsCA9P8stfTN+TcZucLzK2BN6b6NG07zOMlLixYoEDV/utZbPvXy3
	NxL7LJw1wCoran8mttknT8nXxRM8vLSXmtiqqTW88FIpQ6IzGnrY6bzVH+38jqI4UA
	SvOo7+FwAS808bh6mHZvkmdHcj0URkbXd6vdxVFc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0HFtXIf003584
	for <meta-arago@arago-project.org>; Wed, 17 Jan 2018 09:55:33 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 17 Jan 2018 09:55:32 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Wed, 17 Jan 2018 09:55:32 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>, "Radhakrishnan, Mahesh"
	<m-radhakrishnan2@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [EXTERNAL] [morty][meta-processor-sdk][PATCH v2]
	branding-processor-sdk.inc: Excluding am57x SOC targets for dra7xx PDK
Thread-Index: AQHTj6lfCoJzdNRDkEiAC7syblHqHKN4N83g
Date: Wed, 17 Jan 2018 15:55:32 +0000
Message-ID: <4201c86db53b4fdd940cbb7766039a84@ti.com>
References: <1516198638-17156-1-git-send-email-m-radhakrishnan2@ti.com>
	<56577d8bd31845e38ab6bd69b90b45c9@ti.com>
In-Reply-To: <56577d8bd31845e38ab6bd69b90b45c9@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH v2] branding-processor-sdk.inc: Excluding am57x SOC targets for dra7xx PDK
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
X-List-Received-Date: Wed, 17 Jan 2018 15:55:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is a NAK as it will break openmp-rtos for dra7xx-evm.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Gou, Hongmei
> Sent: Wednesday, January 17, 2018 10:39 AM
> To: Radhakrishnan, Mahesh; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [EXTERNAL] [morty][meta-processor-sdk][PATCH
> v2] branding-processor-sdk.inc: Excluding am57x SOC targets for dra7xx PD=
K
>=20
> Thanks for providing the v2 patch. Please update the patch using the orig=
inal
> file as the baseline, rather than the v1 patch.
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> > Sent: Wednesday, January 17, 2018 9:17 AM
> > To: meta-arago@arago-project.org
> > Subject: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH v2]
> > branding-processor-sdk.inc: Excluding am57x SOC targets for dra7xx PDK
> >
> > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > ---
> >
> >  v2 - Fixed TI_LIMIT_SOCS change to apply only for dra7xx-evm
> >
> >  conf/distro/include/branding-processor-sdk.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/conf/distro/include/branding-processor-sdk.inc
> > b/conf/distro/include/branding-processor-sdk.inc
> > index ff127d4..0803ba1 100644
> > --- a/conf/distro/include/branding-processor-sdk.inc
> > +++ b/conf/distro/include/branding-processor-sdk.inc
> > @@ -106,5 +106,5 @@ SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-
> > staging =3D "${SRCIPK_GIT_COMMIT_MESSAGE}"
> >  TI_PDK_LIMIT_SOCS_append_am57xx-evm =3D " am574x"
> >  TI_PDK_LIMIT_BOARDS_append_am57xx-evm =3D " idkAM574x"
> >
> > -TI_PDK_LIMIT_SOCS =3D "dra72x dra75x dra78x"
> > +TI_PDK_LIMIT_SOCS_dra7xx-evm =3D "dra72x dra75x dra78x"
> >
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

