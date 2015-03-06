Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 63F1652972
	for <meta-arago@arago-project.org>;
	Fri,  6 Mar 2015 22:48:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t26MmKxM025627
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2015 16:48:20 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t26MmJ8Y013863
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2015 16:48:19 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Mar 2015 16:48:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t26MmIYM020613;
	Fri, 6 Mar 2015 16:48:19 -0600
Date: Fri, 6 Mar 2015 17:48:18 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150306224818.GZ6052@edge>
References: <1425652463-30312-1-git-send-email-j-stiffler@ti.com>
	<4B26FB5A64EBA14C87266869E037F95814106A1B@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C838EAA@DFLE08.ent.ti.com>
	<4B26FB5A64EBA14C87266869E037F95814106A64@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C8390E1@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C8390E1@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] tisdk-image: Fix manifest generation for nativesdk.
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
X-List-Received-Date: Fri, 06 Mar 2015 22:48:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

Can you please refresh my mind with more details of the problem? Thanks.


On Fri, Mar 06, 2015 at 08:49:10PM +0000, Cooper Jr., Franklin wrote:
> Ah I'm not aware of that since I never ran into the issue.
> 
> > -----Original Message-----
> > From: Stiffler, Jacob
> > Sent: Friday, March 06, 2015 1:45 PM
> > To: Cooper Jr., Franklin; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH v2] tisdk-image: Fix manifest generation
> > for nativesdk.
> > 
> > I ran into this issue in December. Denys also reported seeing the same issue.
> > 
> > -----Original Message-----
> > From: Cooper Jr., Franklin
> > Sent: Friday, March 06, 2015 2:38 PM
> > To: Stiffler, Jacob; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH v2] tisdk-image: Fix manifest generation
> > for nativesdk.
> > 
> > Don't know what the issue is especially since your saying that the problem is
> > on the build machine and not your local setup.
> > 
> > I just made a release a little less than a month ago and haven't had a problem
> > on my local or build machine. Nothing important has changed within oe-core
> > in the last several months and nothing has changed within oe-core within the
> > last several months. Denys did change the version of bitbake used by default
> > but that wouldn't explain the different behavior between your machines.
> > 
> > So it seems like the issue points to your build machine.
> > 
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> > > Sent: Friday, March 06, 2015 1:26 PM
> > > To: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH v2] tisdk-image: Fix manifest
> > > generation for nativesdk.
> > >
> > > I also need to revoke this patch. I forgot I am not able to recreate
> > > this issue on my local setup, and I have only seen it on the build machine.
> > >
> > > This patch will cause a build failure if any of the oe* package
> > > indexes are empty, as the " grep -n "^Package" $pkg_idx" will return an
> > error.
> > >
> > > Are there any other comments which I may address in the v3?
> > >
> > > Thanks,
> > > Jake
> > >
> > > -----Original Message-----
> > > From: Stiffler, Jacob
> > > Sent: Friday, March 06, 2015 9:34 AM
> > > To: meta-arago@arago-project.org
> > > Cc: Stiffler, Jacob
> > > Subject: [PATCH v2] tisdk-image: Fix manifest generation for nativesdk.
> > >
> > > * The manifest is automatically generated based on *.control
> > >   files found within the various images.
> > > * The control files for the nativesdk image have gone missing.
> > > * Work around this by regenerating the control files from the
> > >   package index.
> > >
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > ---
> > > v2 changes:
> > > Parse all "oe*" package indexes instead of only "oe-*-nativesdk" indexes.
> > >
> > >
> > >  meta-arago-distro/classes/tisdk-image.bbclass |   37
> > > +++++++++++++++++++++++++
> > >  1 file changed, 37 insertions(+)
> > >
> > > diff --git a/meta-arago-distro/classes/tisdk-image.bbclass
> > > b/meta-arago- distro/classes/tisdk-image.bbclass
> > > index 3030a38..b9d86af 100644
> > > --- a/meta-arago-distro/classes/tisdk-image.bbclass
> > > +++ b/meta-arago-distro/classes/tisdk-image.bbclass
> > > @@ -353,6 +353,43 @@ echo "
> > >  </tr>
> > >  " >> ${SW_MANIFEST_FILE}
> > >
> > > +    control_files_there=0
> > > +    for possible_control_file in $control_dir/*.control
> > > +    do
> > > +        if [ -f $possible_control_file ]
> > > +        then
> > > +            control_files_there=1
> > > +            break
> > > +        fi
> > > +    done
> > > +
> > > +    if [ $control_files_there -eq 0 ]
> > > +    then
> > > +        for pkg_idx in $control_dir/oe*; do
> > > +            package_start=`grep -n "^Package" $pkg_idx`
> > > +
> > > +            IFS_OLD=${IFS}
> > > +            IFS="
> > > +"
> > > +
> > > +            for pkg in ${package_start}; do
> > > +                end=`echo $pkg | cut -d: -f1`
> > > +
> > > +                if [ -z $begin ]; then
> > > +                    pkg_name=`echo $pkg | cut -d: -f3`
> > > +                    begin=`echo $pkg | cut -d: -f1`
> > > +                    continue
> > > +                fi
> > > +                cnt=$[$cnt+1]
> > > +                head -n $[$end - 1] $pkg_idx | tail -n $[$end -
> > > + $begin] >
> > > ${control_dir}/${pkg_name// /}.control
> > > +
> > > +                pkg_name=`echo $pkg | cut -d: -f3`
> > > +                begin=$end
> > > +            done
> > > +            IFS=${IFS_OLD}
> > > +        done
> > > +    fi
> > > +
> > >      for i in $control_dir/*.control
> > >      do
> > >          package="`cat $i | grep Package: | awk {'print $2'}`"
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

