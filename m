Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 17D28520C1
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 13:49:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RDn08E013536
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 08:49:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490622540;
	bh=wNreDrNP4OnFG2HYIw/ZUPUboJXhlsOuarV9fDMPbOU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Imisvdlrirl7la4pOoN2Ml70QwrvrUpgYtWxLB7hdFxXHz0ZD5zF5mBAmfddUk7gd
	7EXVBL94ZK2+eGU6WUdK38WJ+TnZa1q0hO95pSiJw591mahXKVsO91CBlLupGH8rJt
	DRg5IqaH6k6em3buBV7mbxgSkW/qRBULK1VuJ7Gg=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RDn0vb021807
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 08:49:00 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 27 Mar 2017 08:49:00 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] setup-uboot-env-k2g-evm: add
	set_name_pmmc to bootcmd
Thread-Index: AQHSpv/8WZTlScp3r0iKJiy+oC3ZLqGpB04A//+sTiA=
Date: Mon, 27 Mar 2017 13:48:59 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958253CAB2F@DFLE09.ent.ti.com>
References: <1490622150-3213-1-git-send-email-j-stiffler@ti.com>
	<20170327134758.GS29187@edge>
In-Reply-To: <20170327134758.GS29187@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] setup-uboot-env-k2g-evm: add set_name_pmmc to bootcmd
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
X-List-Received-Date: Mon, 27 Mar 2017 13:49:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, March 27, 2017 9:48 AM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] setup-uboot-env-k2g-evm: add
> set_name_pmmc to bootcmd
>=20
> Which branch this should go in?
>=20

Sorry, I messed up the header. This is for tisdk-setup-scripts, not meta-ar=
ago.

> On Mon, Mar 27, 2017 at 09:42:29AM -0400, Jacob Stiffler wrote:
> > * set_name_pmmc must be called to set the filename of the pmmc
> >   firmware.
> >
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  setup-uboot-env-k2g-evm.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/setup-uboot-env-k2g-evm.sh b/setup-uboot-env-k2g-evm.sh
> > index c80e506..4944f99 100755
> > --- a/setup-uboot-env-k2g-evm.sh
> > +++ b/setup-uboot-env-k2g-evm.sh
> > @@ -187,7 +187,7 @@ do_expect "\"$prompt\"" "send \"setenv name_ubi
> > $ubifsimage\"" $cwd/setupBoard.m  do_expect "\"$prompt\"" "send
> > \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
> do_expect
> > "\"$prompt\"" "send \"setenv name_uboot $ubootimage\""
> > $cwd/setupBoard.minicom
> >
> > -do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run
> > init_\${fs_mode} get_pmmc_\${kern_mode} run_pmmc
> get_mon_\${kern_mode}
> > run_mon findfdt get_fdt_\${kern_mode} get_kern_\${kern_mode}
> > run_kern'\"" $cwd/setupBoard.minicom
> > +do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run
> > +init_\${fs_mode} set_name_pmmc get_pmmc_\${kern_mode} run_pmmc
> > +get_mon_\${kern_mode} run_mon findfdt get_fdt_\${kern_mode}
> > +get_kern_\${kern_mode} run_kern'\"" $cwd/setupBoard.minicom
> >
> >  do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
> >
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

