Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0E748529A7
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2013 20:00:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QK0Ak7026846
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2013 15:00:10 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QK0Axv023855
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2013 15:00:10 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 26 Sep 2013 15:00:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QK09cE005084;
	Thu, 26 Sep 2013 15:00:09 -0500
Date: Thu, 26 Sep 2013 16:00:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130926200008.GA16261@edge>
References: <1380055815-19631-1-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C55CF17@DFLE08.ent.ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E8B1DE5@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE72E8B1DE5@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCHv2] oe-layertool-setup.sh: properly set DL_DIR
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
X-List-Received-Date: Thu, 26 Sep 2013 20:00:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I believe there is a bug introduced by this patch - DL_DIR doesn't get set 
with default on first run when no -d option is specified...


On Tue, Sep 24, 2013 at 04:18:11PM -0400, Dmytriyenko, Denys wrote:
>    Ack
> 
>    Denys
> 
>    -----Original Message-----
>    From: Cooper Jr., Franklin [fcooper@ti.com]
>    Received: Tuesday, 24 Sep 2013, 16:10
>    To: Maupin, Chase [chase.maupin@ti.com]; meta-arago@arago-project.org
>    [meta-arago@arago-project.org]
>    Subject: Re: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly set
>    DL_DIR
> 
>    Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
> 
>    > -----Original Message-----
>    > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>    > bounces@arago-project.org] On Behalf Of Maupin, Chase
>    > Sent: Tuesday, September 24, 2013 3:50 PM
>    > To: meta-arago@arago-project.org
>    > Subject: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly set
>    DL_DIR
>    >
>    > * This script took a parameter using -d to set the DL_DIR but
>    >   ignored that setting.  Now if that is set make it the DL_DIR
>    >   value in conf/local.conf
>    > * When running this script to get updates changes that were made
>    >   to DL_DIR were lost because local.conf was copied over.  Now
>    >   the script will use the old DL_DIR setting.
>    >
>    > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>    >
>    > ---
>    > * Updated in version 2
>    >     * Removed sh -x setting which was accidentally left over
>    >     * Fixed typo in commit message
>    > ---
>    >  oe-layertool-setup.sh |   17 ++++++++++++++++-
>    >  1 files changed, 16 insertions(+), 1 deletions(-)
>    >
>    > diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh index
>    > 55cd174..72e36a2 100755
>    > --- a/oe-layertool-setup.sh
>    > +++ b/oe-layertool-setup.sh
>    > @@ -732,6 +732,22 @@ EOM
>    >      threads=`cat /proc/cpuinfo | grep -c processor`
>    >      sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE = \"-j ${threads}\"/"
>    > $confdir/local.conf
>    >      sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS =
>    > \"${threads}\"/" $confdir/local.conf
>    > +
>    > +    # Find if old DL_DIR was set
>    > +    if [ -e $confdir/local.conf.bak ]
>    > +    then
>    > +        old_dldir=`cat $confdir/local.conf.bak | grep -e "^DL_DIR =" |
>    sed
>    > 's|DL_DIR = ||' | sed 's/"//g'`
>    > +    else
>    > +        old_dldir="$dldir"
>    > +    fi
>    > +
>    > +    # If command line option was not set use the old dldir
>    > +    if [ "x$dldir" == "x" ]
>    > +    then
>    > +        dldir=$old_dldir
>    > +    fi
>    > +
>    > +    sed -i "s|^DL_DIR.*|DL_DIR = \"${dldir}\"|" $confdir/local.conf
>    >  }
>    >
>    >
>    > @@ -838,7 +854,6 @@ cd -
>    >  sourcedir="$oebase/sources"
>    >  builddir="$oebase/build"
>    >  confdir="$builddir/conf"
>    > -dldir="$oebase/downloads"
>    >
>    >  check_input
>    >
>    > --
>    > 1.7.0.4
>    >
>    > _______________________________________________
>    > meta-arago mailing list
>    > meta-arago@arago-project.org
>    > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>    _______________________________________________
>    meta-arago mailing list
>    meta-arago@arago-project.org
>    http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

