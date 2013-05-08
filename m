Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6D92F5298C
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 14:13:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48EDLeo012842
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 09:13:21 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48EDL5S018716
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 09:13:21 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 8 May 2013 09:13:21 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] meta-toolchain-arago: Allow relocate
	script to hard code SDK_PATH value
Thread-Index: AQHOS+6YIXwHuWd05EyzTdFPsB4RpJj7pGEA//+sxaA=
Date: Wed, 8 May 2013 14:13:19 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C44E18B@DFLE08.ent.ti.com>
References: <1368019131-13375-1-git-send-email-fcooper@ti.com>
	<20130508135910.GA13151@edge>
In-Reply-To: <20130508135910.GA13151@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] meta-toolchain-arago: Allow relocate script to hard code SDK_PATH value
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
X-List-Received-Date: Wed, 08 May 2013 14:13:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, May 08, 2013 8:59 AM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago: Allow relocate sc=
ript
> to hard code SDK_PATH value
>=20
> Franklin,
>=20
> Well, I think I already used up all my weekly quota for reviewing patches
> yesterday... :) But, Ok.
>=20
>=20
> > * SDK_PATH was previously dynamically determined by using BASHISMS
> when
> >   environment-setup was sourced.
>=20
> But there was still a known good fallback for when not run under bash.
>=20
>=20
> > * Relocate_sdk.py is required to be ran and the script knows the locati=
on of
> the
> >   toolchain SDK.
> > * By having the relocate_sdk script set SDK_PATH we remove the need for
> >   bashisms from environment-setup.
>=20
> It is already doing that, no need to change it.
>=20
>=20
> > diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.b=
b
> b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > index 699ada7..7f70c42 100644
> > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > @@ -7,7 +7,7 @@ TOOLCHAIN_CLEANUP_PACKAGES ?=3D ""
> >
> >  require recipes-core/meta/meta-toolchain.bb
> >
> > -PR =3D "r23"
> > +PR =3D "r24"
> >
> >  # This function creates an environment-setup-script for use in a deplo=
yable
> SDK
> >  toolchain_create_sdk_env_script () {
> > @@ -15,17 +15,7 @@ toolchain_create_sdk_env_script () {
> >  	script=3D${SDK_OUTPUT}/${SDKPATH}/environment-setup
> >  	rm -f $script
> >  	touch $script
> > -	echo 'SDK_PATH=3D"${SDKPATH}"' >> $script
> > -	echo 'if [ -z "$ZSH_NAME" ] && [ "x$0" =3D "x./environment-setup" ];
> then' >> $script
> > -	echo '    echo "Error: This script needs to be sourced. Please run as=
 \".
> ./environment-setup\""' >> $script
> > -	echo '    exit 1' >> $script
>=20
> This portion above may stay - it's a nice safeguard. And there's nothing
> bashisms about it.

Your right. I must of gotten delete happy :).
>=20
>=20
> > -	echo 'else' >> $script
> > -	echo '    if [ -n "$BASH_SOURCE" ]; then' >> $script
> > -	echo '        SDK_PATH=3D"`dirname $BASH_SOURCE`"' >> $script
> > -	echo '    fi' >> $script
>=20
> I can see potentially removing this portion, since devkit is not relocata=
ble
> on its own w/o re-installing it in a different location. BTW, this is the=
 only
> bash-related piece of code here, it just uses bash-specific env variable.=
 If
> not run under bash, it will safely skip it, so it's not really a bashism.
True but the SDK_PATH would not be the correct value.
Current value of SDK_PATH:
SDK_PATH=3D/tmp/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx..../yyy=
yyyyyyyyyyyyyyyyyyyyyyyyyyyyy...../

So although no error will be shown the remaining code and variables will be=
 using the incorrect SDK_PATH which results in a lot of issues.
>=20
>=20
> > -	echo '    SDK_PATH=3D`readlink -f "$SDK_PATH"`' >> $script
> > -	echo '    export SDK_PATH' >> $script
> > -	echo 'fi' >> $script
>=20
> And this portion is another nice safeguard - in case you install it in a
> location that is a symlink.
That makes sense. This can stay also.
>=20
>=20
> > +	echo 'export SDK_PATH=3D"${SDKPATH}"' >> $script
> >  	echo 'export SDK_SYS=3D${SDK_SYS}' >> $script
> >  	echo 'export TARGET_SYS=3D${REAL_MULTIMACH_TARGET_SYS}' >>
> $script
> >  	echo 'export TOOLCHAIN_SYS=3D${TOOLCHAIN_SYS}' >> $script
> > @@ -234,6 +224,9 @@ for env_setup_script in `ls
> $target_sdk_dir/environment-setup*`; do
> >  	$SUDO_EXEC sed -e "s:$TMPSDKPATH:$target_sdk_dir:g" -i
> $env_setup_script
> >  done
> >
> > +# Correct SDK_PATH since the exact installation path is now known
> > +$SUDO_EXEC sed -i -e "s|export SDK_PATH\=3D.*|export
> SDK_PATH=3D$target_sdk_dir|g" $target_sdk_dir/environment-setup*
>=20
> Why do you need this line? It's already happening anyway.
The only way we get the proper value for SDK_PATH is if the following is ex=
ecuted.
       SDK_PATH=3D"`dirname $BASH_SOURCE`"' >> $script

Since I want to remove that logic the above is required. Although the sed s=
tatement would change slightly since "SDK_PATH=3D" will need to be modified=
 instead of "export SDK_PATH=3D" since I won't be removing a lot of the saf=
e guard logic.

>=20
> --
> Denys

