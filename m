Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 8599352983
	for <meta-arago@arago-project.org>;
	Tue,  6 Dec 2016 12:18:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id uB6CIMKn007896
	for <meta-arago@arago-project.org>; Tue, 6 Dec 2016 06:18:22 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB6CIMlG011225
	for <meta-arago@arago-project.org>; Tue, 6 Dec 2016 06:18:22 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Tue, 6 Dec 2016 06:18:21 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [tisdk-setup-scripts][PATCH 2/2]
	setup-uboot-env-k2g-evm.sh: update for latest default env
Thread-Index: AQHSS86hQzT31Scw6Uynwcfm8EVk1qD6tiQAgAAnxGA=
Date: Tue, 6 Dec 2016 12:18:21 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9582536DBC0@DFLE09.ent.ti.com>
References: <1480595392-18576-1-git-send-email-j-stiffler@ti.com>
	<1480595392-18576-2-git-send-email-j-stiffler@ti.com>
	<20161206035530.GF28380@edge>
In-Reply-To: <20161206035530.GF28380@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [tisdk-setup-scripts][PATCH 2/2] setup-uboot-env-k2g-evm.sh: update for latest default env
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
X-List-Received-Date: Tue, 06 Dec 2016 12:18:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, December 05, 2016 10:56 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [tisdk-setup-scripts][PATCH 2/2] setup-uboot-
> env-k2g-evm.sh: update for latest default env
>=20
> On Thu, Dec 01, 2016 at 07:29:52AM -0500, Jacob Stiffler wrote:
> > * We now need to call "findfdt" so that "name_fdt" is defined.
> >
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>=20
> Acked-by: Denys Dmytriyenko <denys@ti.com>
>=20
>=20
> Please push both of these in.
>=20

Should I add the "Acked-by" in the commit message?

>=20
> > ---
> >  setup-uboot-env-k2g-evm.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/setup-uboot-env-k2g-evm.sh b/setup-uboot-env-k2g-evm.sh
> > index f41d278..c80e506 100755
> > --- a/setup-uboot-env-k2g-evm.sh
> > +++ b/setup-uboot-env-k2g-evm.sh
> > @@ -187,7 +187,7 @@ do_expect "\"$prompt\"" "send \"setenv name_ubi
> $ubifsimage\"" $cwd/setupBoard.m
> >  do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\""
> $cwd/setupBoard.minicom
> >  do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\""
> $cwd/setupBoard.minicom
> >
> > -do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run
> init_\${fs_mode} get_pmmc_\${kern_mode} run_pmmc
> get_fdt_\${kern_mode} get_mon_\${kern_mode} get_kern_\${kern_mode}
> run_mon run_kern'\"" $cwd/setupBoard.minicom
> > +do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run
> init_\${fs_mode} get_pmmc_\${kern_mode} run_pmmc
> get_mon_\${kern_mode} run_mon findfdt get_fdt_\${kern_mode}
> get_kern_\${kern_mode} run_kern'\"" $cwd/setupBoard.minicom
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

