Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id E715E520C1
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 13:50:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RDoraq013812
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 08:50:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490622653;
	bh=Ju9zVTZ6ARKhXSFv9MKSISy64cdoqnZJghKJ9wKDBkU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fV3P8Clfh9rR6Nzu++ILGpM9m5f2q1kLLEUGACw/Q6u85viDNDbGC0kuoFt/6abP4
	WuqFlH1aKQSZUN+govWbhNaHTcwFQoxv7zWW3nyAOOE5NEQu9eKdxoFrbXN4RVO1n5
	PVStCb3kuIj7m4zIJRcKBW9bKLemvJa0q7lS43BM=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RDor1W023638
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 08:50:53 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 08:50:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RDorPp011020;
	Mon, 27 Mar 2017 08:50:53 -0500
Date: Mon, 27 Mar 2017 09:50:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20170327135052.GT29187@edge>
References: <1490622150-3213-1-git-send-email-j-stiffler@ti.com>
	<20170327134758.GS29187@edge>
	<4B26FB5A64EBA14C87266869E037F958253CAB2F@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F958253CAB2F@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Mon, 27 Mar 2017 13:50:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 27, 2017 at 09:48:59AM -0400, Stiffler, Jacob wrote:
> > Which branch this should go in?
> 
> Sorry, I messed up the header. This is for tisdk-setup-scripts, not meta-arago.

Well, makes sense - I should have looked at the code... :)


> > On Mon, Mar 27, 2017 at 09:42:29AM -0400, Jacob Stiffler wrote:
> > > * set_name_pmmc must be called to set the filename of the pmmc
> > >   firmware.
> > >
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > ---
> > >  setup-uboot-env-k2g-evm.sh | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/setup-uboot-env-k2g-evm.sh b/setup-uboot-env-k2g-evm.sh
> > > index c80e506..4944f99 100755
> > > --- a/setup-uboot-env-k2g-evm.sh
> > > +++ b/setup-uboot-env-k2g-evm.sh
> > > @@ -187,7 +187,7 @@ do_expect "\"$prompt\"" "send \"setenv name_ubi
> > > $ubifsimage\"" $cwd/setupBoard.m  do_expect "\"$prompt\"" "send
> > > \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
> > do_expect
> > > "\"$prompt\"" "send \"setenv name_uboot $ubootimage\""
> > > $cwd/setupBoard.minicom
> > >
> > > -do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run
> > > init_\${fs_mode} get_pmmc_\${kern_mode} run_pmmc
> > get_mon_\${kern_mode}
> > > run_mon findfdt get_fdt_\${kern_mode} get_kern_\${kern_mode}
> > > run_kern'\"" $cwd/setupBoard.minicom
> > > +do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run
> > > +init_\${fs_mode} set_name_pmmc get_pmmc_\${kern_mode} run_pmmc
> > > +get_mon_\${kern_mode} run_mon findfdt get_fdt_\${kern_mode}
> > > +get_kern_\${kern_mode} run_kern'\"" $cwd/setupBoard.minicom
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

