Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 277BD52AA2
	for <meta-arago@arago-project.org>;
	Tue,  6 Dec 2016 19:30:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id uB6JUCQ2027542
	for <meta-arago@arago-project.org>; Tue, 6 Dec 2016 13:30:12 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB6JUCpw000977
	for <meta-arago@arago-project.org>; Tue, 6 Dec 2016 13:30:12 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 6 Dec 2016 13:30:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB6JUC5c030874;
	Tue, 6 Dec 2016 13:30:12 -0600
Date: Tue, 6 Dec 2016 14:30:11 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20161206193011.GJ28380@edge>
References: <1480595392-18576-1-git-send-email-j-stiffler@ti.com>
	<1480595392-18576-2-git-send-email-j-stiffler@ti.com>
	<20161206035530.GF28380@edge>
	<4B26FB5A64EBA14C87266869E037F9582536DBC0@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9582536DBC0@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Tue, 06 Dec 2016 19:30:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Dec 06, 2016 at 07:18:21AM -0500, Stiffler, Jacob wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, December 05, 2016 10:56 PM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [tisdk-setup-scripts][PATCH 2/2] setup-uboot-
> > env-k2g-evm.sh: update for latest default env
> > 
> > On Thu, Dec 01, 2016 at 07:29:52AM -0500, Jacob Stiffler wrote:
> > > * We now need to call "findfdt" so that "name_fdt" is defined.
> > >
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > 
> > Acked-by: Denys Dmytriyenko <denys@ti.com>
> > 
> > 
> > Please push both of these in.
> > 
> 
> Should I add the "Acked-by" in the commit message?

If you use Patchwork, you can just grab "mbox" formatted patch from there and 
it will have all the collected Acks or SoBs for you ready to apply.

-- 
Denys


> > > ---
> > >  setup-uboot-env-k2g-evm.sh | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/setup-uboot-env-k2g-evm.sh b/setup-uboot-env-k2g-evm.sh
> > > index f41d278..c80e506 100755
> > > --- a/setup-uboot-env-k2g-evm.sh
> > > +++ b/setup-uboot-env-k2g-evm.sh
> > > @@ -187,7 +187,7 @@ do_expect "\"$prompt\"" "send \"setenv name_ubi
> > $ubifsimage\"" $cwd/setupBoard.m
> > >  do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\""
> > $cwd/setupBoard.minicom
> > >  do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\""
> > $cwd/setupBoard.minicom
> > >
> > > -do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run
> > init_\${fs_mode} get_pmmc_\${kern_mode} run_pmmc
> > get_fdt_\${kern_mode} get_mon_\${kern_mode} get_kern_\${kern_mode}
> > run_mon run_kern'\"" $cwd/setupBoard.minicom
> > > +do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run
> > init_\${fs_mode} get_pmmc_\${kern_mode} run_pmmc
> > get_mon_\${kern_mode} run_mon findfdt get_fdt_\${kern_mode}
> > get_kern_\${kern_mode} run_kern'\"" $cwd/setupBoard.minicom
> > >
> > >  do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
> > >
> > > --
> > > 1.9.1
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

