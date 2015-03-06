Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B8E4052972
	for <meta-arago@arago-project.org>;
	Fri,  6 Mar 2015 20:49:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t26KnCWZ007915
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2015 14:49:13 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t26KnBsr029838
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2015 14:49:11 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Fri, 6 Mar 2015 14:49:11 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] tisdk-image: Fix manifest generation
	for nativesdk.
Thread-Index: AQHQWENv7+SOppA4DEC61GEJOPfHGZ0P2DowgABn8YD//602oA==
Date: Fri, 6 Mar 2015 20:49:10 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C8390E1@DFLE08.ent.ti.com>
References: <1425652463-30312-1-git-send-email-j-stiffler@ti.com>
	<4B26FB5A64EBA14C87266869E037F95814106A1B@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C838EAA@DFLE08.ent.ti.com>
	<4B26FB5A64EBA14C87266869E037F95814106A64@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F95814106A64@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v2] tisdk-image: Fix manifest generation	for nativesdk.
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
X-List-Received-Date: Fri, 06 Mar 2015 20:49:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ah I'm not aware of that since I never ran into the issue.

> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Friday, March 06, 2015 1:45 PM
> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH v2] tisdk-image: Fix manifest generation
> for nativesdk.
>=20
> I ran into this issue in December. Denys also reported seeing the same is=
sue.
>=20
> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Friday, March 06, 2015 2:38 PM
> To: Stiffler, Jacob; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH v2] tisdk-image: Fix manifest generation
> for nativesdk.
>=20
> Don't know what the issue is especially since your saying that the proble=
m is
> on the build machine and not your local setup.
>=20
> I just made a release a little less than a month ago and haven't had a pr=
oblem
> on my local or build machine. Nothing important has changed within oe-cor=
e
> in the last several months and nothing has changed within oe-core within =
the
> last several months. Denys did change the version of bitbake used by defa=
ult
> but that wouldn't explain the different behavior between your machines.
>=20
> So it seems like the issue points to your build machine.
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> > Sent: Friday, March 06, 2015 1:26 PM
> > To: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH v2] tisdk-image: Fix manifest
> > generation for nativesdk.
> >
> > I also need to revoke this patch. I forgot I am not able to recreate
> > this issue on my local setup, and I have only seen it on the build mach=
ine.
> >
> > This patch will cause a build failure if any of the oe* package
> > indexes are empty, as the " grep -n "^Package" $pkg_idx" will return an
> error.
> >
> > Are there any other comments which I may address in the v3?
> >
> > Thanks,
> > Jake
> >
> > -----Original Message-----
> > From: Stiffler, Jacob
> > Sent: Friday, March 06, 2015 9:34 AM
> > To: meta-arago@arago-project.org
> > Cc: Stiffler, Jacob
> > Subject: [PATCH v2] tisdk-image: Fix manifest generation for nativesdk.
> >
> > * The manifest is automatically generated based on *.control
> >   files found within the various images.
> > * The control files for the nativesdk image have gone missing.
> > * Work around this by regenerating the control files from the
> >   package index.
> >
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> > v2 changes:
> > Parse all "oe*" package indexes instead of only "oe-*-nativesdk" indexe=
s.
> >
> >
> >  meta-arago-distro/classes/tisdk-image.bbclass |   37
> > +++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/meta-arago-distro/classes/tisdk-image.bbclass
> > b/meta-arago- distro/classes/tisdk-image.bbclass
> > index 3030a38..b9d86af 100644
> > --- a/meta-arago-distro/classes/tisdk-image.bbclass
> > +++ b/meta-arago-distro/classes/tisdk-image.bbclass
> > @@ -353,6 +353,43 @@ echo "
> >  </tr>
> >  " >> ${SW_MANIFEST_FILE}
> >
> > +    control_files_there=3D0
> > +    for possible_control_file in $control_dir/*.control
> > +    do
> > +        if [ -f $possible_control_file ]
> > +        then
> > +            control_files_there=3D1
> > +            break
> > +        fi
> > +    done
> > +
> > +    if [ $control_files_there -eq 0 ]
> > +    then
> > +        for pkg_idx in $control_dir/oe*; do
> > +            package_start=3D`grep -n "^Package" $pkg_idx`
> > +
> > +            IFS_OLD=3D${IFS}
> > +            IFS=3D"
> > +"
> > +
> > +            for pkg in ${package_start}; do
> > +                end=3D`echo $pkg | cut -d: -f1`
> > +
> > +                if [ -z $begin ]; then
> > +                    pkg_name=3D`echo $pkg | cut -d: -f3`
> > +                    begin=3D`echo $pkg | cut -d: -f1`
> > +                    continue
> > +                fi
> > +                cnt=3D$[$cnt+1]
> > +                head -n $[$end - 1] $pkg_idx | tail -n $[$end -
> > + $begin] >
> > ${control_dir}/${pkg_name// /}.control
> > +
> > +                pkg_name=3D`echo $pkg | cut -d: -f3`
> > +                begin=3D$end
> > +            done
> > +            IFS=3D${IFS_OLD}
> > +        done
> > +    fi
> > +
> >      for i in $control_dir/*.control
> >      do
> >          package=3D"`cat $i | grep Package: | awk {'print $2'}`"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

