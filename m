Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id ED52152A61
	for <meta-arago@arago-project.org>;
	Tue, 18 Mar 2014 14:25:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2IEPiKI011853;
	Tue, 18 Mar 2014 09:25:44 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2IEPiDg000753;
	Tue, 18 Mar 2014 09:25:44 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Mar 2014 09:25:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2IEPhfM029597;
	Tue, 18 Mar 2014 09:25:43 -0500
Date: Tue, 18 Mar 2014 10:25:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140318142543.GW12929@edge>
References: <1393889779-3995-1-git-send-email-denis@denix.org>
	<1393889779-3995-6-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C66853C@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C66853C@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [tisdk-build-scripts][PATCH 5/5] arago-core-tisdk-dylan-puget: update to use new CLI
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
X-List-Received-Date: Tue, 18 Mar 2014 14:25:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Mar 18, 2014 at 02:20:28PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Monday, March 03, 2014 5:36 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [tisdk-build-scripts][PATCH 5/5] arago-core-tisdk-dylan-
> > puget: update to use new CLI
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  configs/arago-core-tisdk-dylan-puget.txt |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/configs/arago-core-tisdk-dylan-puget.txt b/configs/arago-core-tisdk-
> > dylan-puget.txt
> > index f4ccb26..e24ab70 100644
> > --- a/configs/arago-core-tisdk-dylan-puget.txt
> > +++ b/configs/arago-core-tisdk-dylan-puget.txt
> > @@ -164,11 +164,11 @@ TEST_LOCAL_IFACE="eth1"
> > 
> >  # This variable contains the tarball name for the opentest CLI which is  #
> > required to do target side testing.
> > -OPENTEST_CLI="$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
> > +OPENTEST_CLI="$SCRIPTS_ROOT/linux-devtest.tgz"
> [Franklin] Would it make sense to make this update to all the different configs?

Shouldn't be a problem. At the time of submitting these patches, there were 
other issues with Opentest and no tests were working out of the box. Hence I 
only updated my config for further testing. Most of the issues have been fixed 
since then, so we can update other configs as well. But I made the changes to 
be incremental, so it should work with the old Opentest CLI, if you setup 
requires it. Unfortunately, it no longer works with TIGT...


> >  # This variable specifies the IP address of the TEE to be used with OpenTest  #
> > Defaults to 128.247.105.11 if not set -OPENTEST_TEE_IP="10.218.102.142"
> > +OPENTEST_TEE_IP="none"
> > 
> >  # This variable specifies the hardware capabilities to be used with OpenTest
> > # Capabilities are separated by underscores, some excamples are here:
> > --
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

