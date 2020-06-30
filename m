Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 26F32529E5
	for <meta-arago@arago-project.org>;
	Tue, 30 Jun 2020 21:33:20 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05ULUg3m076374;
	Tue, 30 Jun 2020 16:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1593552642;
	bh=UXgLCRbfyM4HHH/qKuRIzKBJbarBZ8J/wsnRfiG9Cdg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=iWwGMxcQtrmUIXouwsF9R569FXyylQMC7vjBwPlV6bdEZQOdvkmQTY9UZFvpTjl9T
	1l2Bv3pe00qn9ERxcYCmZjzaZtzgrleXC1VdVEheztQLZ9jrhKHNr7cSnrmrcq71se
	ZQ0shkGqn2l2ik2e5gaPusB5ZYUc6o+1wA0Opj+E=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05ULUg9A054469
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Jun 2020 16:30:42 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 30 Jun 2020 16:30:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 30 Jun 2020 16:30:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05ULUf0B007156;
	Tue, 30 Jun 2020 16:30:41 -0500
Date: Tue, 30 Jun 2020 17:30:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Barker <pbarker@konsulko.com>
Message-ID: <20200630213041.GN7211@beryl>
References: <20200621204349.363584-1-pbarker@konsulko.com>
	<20200629224351.GD6525@beryl>
MIME-Version: 1.0
In-Reply-To: <20200629224351.GD6525@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell][PATCH] linux: copy-defconfig: Move do_create_srcipk only if defined
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
X-List-Received-Date: Tue, 30 Jun 2020 21:33:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

That doesn't work:

ERROR: 351 unbuildable tasks were found.
These are usually caused by circular dependencies and any circular dependency chains found will be printed below. Increase the debug level to see a list of unbuildable tasks.

Identifying dependency loops (this may take a short while)...

ERROR: 
Dependency loop #1 found:
  Task /OE/arago-dunfell/sources/meta-ti/recipes-kernel/linux/linux-ti-staging_5.4.bb:do_compile (dependent Tasks ['linux-ti-staging_5.4.bb:do_configure'])
  Task /OE/arago-dunfell/sources/meta-ti/recipes-kernel/linux/linux-ti-staging_5.4.bb:do_create_srcipk (dependent Tasks ['external-arm-toolchain.bb:do_patch', 'bc_1.07.1.bb:do_patch', 'bison_3.5.3.bb:do_patch', 'kmod-native_git.bb:do_patch', 'lzop_1.04.bb:do_patch', 'linux-ti-staging_5.4.bb:do_compile'])
  Task /OE/arago-dunfell/sources/meta-ti/recipes-kernel/linux/linux-ti-staging_5.4.bb:do_configure (dependent Tasks ['linux-ti-staging_5.4.bb:do_prepare_recipe_sysroot', 'linux-ti-staging_5.4.bb:do_patch', 'linux-ti-staging_5.4.bb:do_symlink_kernsrc', 'linux-ti-staging_5.4.bb:do_unpack', 'linux-ti-staging_5.4.bb:do_create_srcipk'])


ERROR: Command execution failed: 1


On Mon, Jun 29, 2020 at 06:43:51PM -0400, Denys Dmytriyenko wrote:
> Thanks, will merge it shortly.
> 
> On Sun, Jun 21, 2020 at 09:43:49PM +0100, Paul Barker wrote:
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  .../recipes-kernel/linux/copy-defconfig.inc              | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
> > index 10ecf8ea..65b615cb 100644
> > --- a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
> > +++ b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
> > @@ -17,6 +17,9 @@ do_configure_append() {
> >      fi
> >  }
> >  
> > -# Move create_srcipk task so that the release defconfig is included.
> > -deltask do_create_srcipk
> > -addtask create_srcipk after do_configure before do_compile
> > +python __anonymous() {
> > +    # Move create_srcipk task so that the release defconfig is included.
> > +    if d.getVarFlag('do_create_srcipk', "task"):
> > +        bb.build.deltask('do_create_srcipk', d)
> > +        bb.build.addtask('do_create_srcipk', 'do_configure', 'do_compile', d)
> > +}
> > -- 
> > 2.27.0
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

