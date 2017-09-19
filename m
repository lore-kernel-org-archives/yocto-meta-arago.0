Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id ED9C752A08
	for <meta-arago@arago-project.org>;
	Tue, 19 Sep 2017 15:20:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8JFK4S2016678
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 10:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505834404;
	bh=fgpHFDnBxtlwuqBdbqtautk1SQQWScV0GIYXd9NGBDA=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=hcBpXYoU9E52WCdzdiQFDLjb4sIgWJm22SaMI8W7eggfA0joS4E0RzH+lJ6RhdOSU
	J+LIKT3bvh5Z0rRT1TvjmP3n78ggfCwYBNKP037LGVbwVOWeJ6Vr8yABNhenwuetCL
	b6TqotU96mNxrPRISfAAur8Ct/lbBpM6jn9PQkwA=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JFK443007083
	for <meta-arago@arago-project.org>; Tue, 19 Sep 2017 10:20:04 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Tue, 19 Sep 2017 10:20:04 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [EXTERNAL] [meta-processor-sdk PATCH] osal:
	Updating to version 1.0.0.8
Thread-Index: AQHTMURhvMqwn5WkhkeguL1tIXuUIKK8Uruw
Date: Tue, 19 Sep 2017 15:20:04 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958254547B4@DFLE09.ent.ti.com>
References: <1505770188-12875-1-git-send-email-m-radhakrishnan2@ti.com>
	<ccbb7990-5207-4aa4-8d14-ccfde15b5131@ti.com>
In-Reply-To: <ccbb7990-5207-4aa4-8d14-ccfde15b5131@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk PATCH] osal: Updating to version 1.0.0.8
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
X-List-Received-Date: Tue, 19 Sep 2017 15:20:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I see the patches were sent to meta-ti. Thank you. This, common-csl-ip, and=
 hyplnk-lld have all be pushed.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> Sent: Tuesday, September 19, 2017 8:40 AM
> To: Radhakrishnan, Mahesh; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [EXTERNAL] [meta-processor-sdk PATCH] osal:
> Updating to version 1.0.0.8
>=20
> These look good. Can you please upstream to corresponding patches to
> meta-ti?
>=20
>=20
> On 9/18/2017 5:29 PM, Mahesh Radhakrishnan wrote:
> > Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> > ---
> >   recipes-bsp/osal/osal-1.0.0.8.inc       | 6 ++++++
> >   recipes-bsp/osal/osal-rtos_git.bbappend | 2 ++
> >   recipes-bsp/osal/osal-test_git.bbappend | 2 ++
> >   recipes-bsp/osal/osal_git.bbappend      | 2 ++
> >   4 files changed, 12 insertions(+)
> >   create mode 100644 recipes-bsp/osal/osal-1.0.0.8.inc
> >   create mode 100644 recipes-bsp/osal/osal-rtos_git.bbappend
> >   create mode 100644 recipes-bsp/osal/osal-test_git.bbappend
> >   create mode 100644 recipes-bsp/osal/osal_git.bbappend
> >
> > diff --git a/recipes-bsp/osal/osal-1.0.0.8.inc b/recipes-bsp/osal/osal-
> 1.0.0.8.inc
> > new file mode 100644
> > index 0000000..b43e43c
> > --- /dev/null
> > +++ b/recipes-bsp/osal/osal-1.0.0.8.inc
> > @@ -0,0 +1,6 @@
> > +# Below commit ID corresponding to "DEV.OSAL.01.00.00.08"
> > +OSAL_SRCREV =3D "ebd3acdbb4e7d6d0393efedd15ce479c5a79772d"
> > +
> > +PV =3D "01.00.00.08"
> > +INC_PR =3D "r0"
> > +
> > diff --git a/recipes-bsp/osal/osal-rtos_git.bbappend b/recipes-
> bsp/osal/osal-rtos_git.bbappend
> > new file mode 100644
> > index 0000000..e164619
> > --- /dev/null
> > +++ b/recipes-bsp/osal/osal-rtos_git.bbappend
> > @@ -0,0 +1,2 @@
> > +require recipes-bsp/osal/osal-1.0.0.8.inc
> > +
> > diff --git a/recipes-bsp/osal/osal-test_git.bbappend b/recipes-
> bsp/osal/osal-test_git.bbappend
> > new file mode 100644
> > index 0000000..e164619
> > --- /dev/null
> > +++ b/recipes-bsp/osal/osal-test_git.bbappend
> > @@ -0,0 +1,2 @@
> > +require recipes-bsp/osal/osal-1.0.0.8.inc
> > +
> > diff --git a/recipes-bsp/osal/osal_git.bbappend b/recipes-
> bsp/osal/osal_git.bbappend
> > new file mode 100644
> > index 0000000..e164619
> > --- /dev/null
> > +++ b/recipes-bsp/osal/osal_git.bbappend
> > @@ -0,0 +1,2 @@
> > +require recipes-bsp/osal/osal-1.0.0.8.inc
> > +
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

