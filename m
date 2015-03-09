Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 75A9F52983
	for <meta-arago@arago-project.org>;
	Mon,  9 Mar 2015 13:49:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t29DnDHk008579
	for <meta-arago@arago-project.org>; Mon, 9 Mar 2015 08:49:13 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t29DnClf021371
	for <meta-arago@arago-project.org>; Mon, 9 Mar 2015 08:49:12 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Mon, 9 Mar 2015 08:49:12 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Cooper Jr., Franklin"
	<fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] tisdk-image: Fix manifest generation
	for nativesdk.
Thread-Index: AQHQWF+kD9QTVR9JT0GjSfyoHYoWNZ0UK49Q
Date: Mon, 9 Mar 2015 13:49:12 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814106DD7@DFLE09.ent.ti.com>
References: <1425652463-30312-1-git-send-email-j-stiffler@ti.com>
	<4B26FB5A64EBA14C87266869E037F95814106A1B@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C838EAA@DFLE08.ent.ti.com>
	<4B26FB5A64EBA14C87266869E037F95814106A64@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C8390E1@DFLE08.ent.ti.com>
	<20150306224818.GZ6052@edge>
In-Reply-To: <20150306224818.GZ6052@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 09 Mar 2015 13:49:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The software manifest is created by parsing the *.control files in the imag=
es /var/lib/opkg directory. For the nativesdk sysroot, there are some cases=
 where the control files are not present. The reason for this and the speci=
fic circumstances of when this occurs has not yet been root caused.=20

When this does happen, the "Development Host Content" tables of the manifes=
t are not valid. However, the package indexes are present. These contain al=
l of the information in the control files, only concatenated together in a =
large file. This patch will split up these package indexes into individual =
control files which will allow the previous parsing to produce a valid outp=
ut.


Here is an example of the invalid output when the control files are not pre=
sent:

<h2><u>Development Host Content</u></h2>
<p>This table describes any software being delivered that is expected to ru=
n on a Development Host, instead of the target device.  Some of this softwa=
re may be licensed under GPLv3 but it is not expected to be shipped as a pr=
oduct.</p>

<table border=3D1 cellspacing=3D1 cellpadding=3D1 width=3D80%>
<tr bgcolor=3D#c0c0c0  color=3Dwhite>
    <td><b>Software Name</b></td>
    <td><b>Version</b></td>
    <td><b>License</b></td>
    <td><b>Location</b></td>
    <td><b>Delivered As</b></td>
    <td><b>Modified by TI</b></td>
    <td><b>Obtained from</b></td>
</tr>

<tr>
    <td> </td>
    <td></td>
    <td ></td>
    <td>__.ipk</td>
    <td>Binary</td>
    <td>No</td>
    <td></td>
</tr>


- Jake



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, March 06, 2015 5:48 PM
To: Cooper Jr., Franklin
Cc: Stiffler, Jacob; meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH v2] tisdk-image: Fix manifest generation f=
or nativesdk.

Jake,

Can you please refresh my mind with more details of the problem? Thanks.


On Fri, Mar 06, 2015 at 08:49:10PM +0000, Cooper Jr., Franklin wrote:
> Ah I'm not aware of that since I never ran into the issue.
>=20
> > -----Original Message-----
> > From: Stiffler, Jacob
> > Sent: Friday, March 06, 2015 1:45 PM
> > To: Cooper Jr., Franklin; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH v2] tisdk-image: Fix manifest=20
> > generation for nativesdk.
> >=20
> > I ran into this issue in December. Denys also reported seeing the same =
issue.
> >=20
> > -----Original Message-----
> > From: Cooper Jr., Franklin
> > Sent: Friday, March 06, 2015 2:38 PM
> > To: Stiffler, Jacob; meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH v2] tisdk-image: Fix manifest=20
> > generation for nativesdk.
> >=20
> > Don't know what the issue is especially since your saying that the=20
> > problem is on the build machine and not your local setup.
> >=20
> > I just made a release a little less than a month ago and haven't had=20
> > a problem on my local or build machine. Nothing important has=20
> > changed within oe-core in the last several months and nothing has=20
> > changed within oe-core within the last several months. Denys did=20
> > change the version of bitbake used by default but that wouldn't explain=
 the different behavior between your machines.
> >=20
> > So it seems like the issue points to your build machine.
> >=20
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-=20
> > > bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> > > Sent: Friday, March 06, 2015 1:26 PM
> > > To: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH v2] tisdk-image: Fix manifest=20
> > > generation for nativesdk.
> > >
> > > I also need to revoke this patch. I forgot I am not able to=20
> > > recreate this issue on my local setup, and I have only seen it on the=
 build machine.
> > >
> > > This patch will cause a build failure if any of the oe* package=20
> > > indexes are empty, as the " grep -n "^Package" $pkg_idx" will=20
> > > return an
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
> > > Subject: [PATCH v2] tisdk-image: Fix manifest generation for nativesd=
k.
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
> > > Parse all "oe*" package indexes instead of only "oe-*-nativesdk" inde=
xes.
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
> > > +    control_files_there=3D0
> > > +    for possible_control_file in $control_dir/*.control
> > > +    do
> > > +        if [ -f $possible_control_file ]
> > > +        then
> > > +            control_files_there=3D1
> > > +            break
> > > +        fi
> > > +    done
> > > +
> > > +    if [ $control_files_there -eq 0 ]
> > > +    then
> > > +        for pkg_idx in $control_dir/oe*; do
> > > +            package_start=3D`grep -n "^Package" $pkg_idx`
> > > +
> > > +            IFS_OLD=3D${IFS}
> > > +            IFS=3D"
> > > +"
> > > +
> > > +            for pkg in ${package_start}; do
> > > +                end=3D`echo $pkg | cut -d: -f1`
> > > +
> > > +                if [ -z $begin ]; then
> > > +                    pkg_name=3D`echo $pkg | cut -d: -f3`
> > > +                    begin=3D`echo $pkg | cut -d: -f1`
> > > +                    continue
> > > +                fi
> > > +                cnt=3D$[$cnt+1]
> > > +                head -n $[$end - 1] $pkg_idx | tail -n $[$end -=20
> > > + $begin] >
> > > ${control_dir}/${pkg_name// /}.control
> > > +
> > > +                pkg_name=3D`echo $pkg | cut -d: -f3`
> > > +                begin=3D$end
> > > +            done
> > > +            IFS=3D${IFS_OLD}
> > > +        done
> > > +    fi
> > > +
> > >      for i in $control_dir/*.control
> > >      do
> > >          package=3D"`cat $i | grep Package: | awk {'print $2'}`"
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

