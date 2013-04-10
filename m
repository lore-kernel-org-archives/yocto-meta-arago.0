Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C279B529F5
	for <meta-arago@arago-project.org>;
	Wed, 10 Apr 2013 22:02:25 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3AM2Pnd022613
	for <meta-arago@arago-project.org>; Wed, 10 Apr 2013 17:02:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3AM2OnZ029074
	for <meta-arago@arago-project.org>; Wed, 10 Apr 2013 17:02:25 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 10 Apr 2013 17:02:24 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r3AM2OYY024064;
	Wed, 10 Apr 2013 17:02:24 -0500
Date: Wed, 10 Apr 2013 18:02:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130410220223.GG3078@edge>
References: <1365007710-12866-1-git-send-email-Chase.Maupin@ti.com>
	<20130405235701.GH31233@denix.org>
	<8C41145C-47F2-478F-ADF3-A0229C36733A@ti.com>
	<20130410214803.GF3078@edge>
	<7D46E86EC0A8354091174257B2FED101594DB245@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101594DB245@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] tisdk-image: add support for DTB files
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
X-List-Received-Date: Wed, 10 Apr 2013 22:02:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 10, 2013 at 05:58:47PM -0400, Maupin, Chase wrote:
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, April 10, 2013 4:48 PM
> > To: Maupin, Chase
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] tisdk-image: add support for
> > DTB files
> > 
> > On Fri, Apr 05, 2013 at 09:37:04PM -0400, Maupin, Chase wrote:
> > > I was thinking that in the case you do want all dtb files you
> > could set no
> > > filter and get them all.
> > 
> > You can also set filter to "*", which would result in 3 stars
> > filter :) but
> > still work as a shell wildcard and pick up all dtbs. Otherwise we
> > would need
> > to check if the filter is "unknown" to skip calling "find"
> > uselessly...
> 
> Are you saying this is an issue?  Not sure if you are expecting some update 
> from me here.

I'm just trying to avoid running find if it's not needed. Are you Ok keying it 
off empty/unset DTB_FILTER as I suggested below? Or if not, do you want to 
check it against "unknown" instead?


> > > On Apr 5, 2013, at 6:57 PM, "Dmytriyenko, Denys" <denys@ti.com>
> > wrote:
> > >
> > > > On Wed, Apr 03, 2013 at 11:48:30AM -0500, Chase Maupin wrote:
> > > >> * If DTB files exist add support for copying those files
> > into
> > > >>  the SDK prebuilt-images directory.
> > > >> * The files to be copied can be controlled using the
> > DTB_FILTER
> > > >>  variable.
> > > >>
> > > >> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > >> ---
> > > >> meta-arago-distro/classes/tisdk-image.bbclass |   10
> > ++++++++++
> > > >> 1 files changed, 10 insertions(+), 0 deletions(-)
> > > >>
> > > >> diff --git a/meta-arago-distro/classes/tisdk-image.bbclass
> > b/meta-arago-distro/classes/tisdk-image.bbclass
> > > >> index a1ce1ad..4e3ed52 100644
> > > >> --- a/meta-arago-distro/classes/tisdk-image.bbclass
> > > >> +++ b/meta-arago-distro/classes/tisdk-image.bbclass
> > > >> @@ -528,6 +528,16 @@ do_sdk_image () {
> > > >>         return 1
> > > >>     fi
> > > >
> > > > I was thinking of adding DTB_FILTER ?= "unknown" here, but
> > then realized it
> > > > would just waste few cycles trying to find something in the
> > deploy directory,
> > > > which we can avoid completely by testing if it set or not...
> > > >
> > > >
> > > >> +    # Copy the DTB files if they exist.
> > > >> +    # NOTE: For simplicity remove the uImage- prefix on the
> > dtb files.  Get just the symlink
> > > >> +    #       files for a cleaner name.  Use the DTB_FILTER
> > variable to allow finding the
> > > >> +    #       dtb files for only that MACHINE type
> > > >
> > > > Wrap the below for loop in "if [ -z "${DTB_FILTER}" ]; then"
> > here?
> > > >
> > > >
> > > >> +    for f in `find ${DEPLOY_DIR_IMAGE} -type l -name
> > "*${DTB_FILTER}*.dtb"`
> > > >> +    do
> > > >> +        dtb_file=`basename $f | sed s/uImage-//`
> > > >> +        cp $f ${prebuilt_dir}/${dtb_file}
> > > >> +    done
> > > >> +
> > > >>     if [ "${SECONDARY_BOOTLOADER_NAME}" != "" ]
> > > >>     then
> > > >>         # Copy the secondary bootloader image if it exists
> > > >> --
> > > >> 1.7.0.4
> > > >>
> > > >> _______________________________________________
> > > >> meta-arago mailing list
> > > >> meta-arago@arago-project.org
> > > >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > >>

