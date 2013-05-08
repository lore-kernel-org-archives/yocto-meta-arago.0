Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2909C5298C
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 14:21:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48EL4M5027870
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 09:21:04 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48EL4Wx028091
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 09:21:04 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 8 May 2013 09:21:04 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r48EL47b022397;
	Wed, 8 May 2013 09:21:04 -0500
Date: Wed, 8 May 2013 10:21:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130508142103.GD13151@edge>
References: <1368019131-13375-1-git-send-email-fcooper@ti.com>
	<20130508135910.GA13151@edge>
	<8F29D6B095ED194EA1980491A5E029710C44E18B@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C44E18B@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Wed, 08 May 2013 14:21:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, May 08, 2013 at 10:13:19AM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, May 08, 2013 8:59 AM
> > To: Cooper Jr., Franklin
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] meta-toolchain-arago: Allow relocate script
> > to hard code SDK_PATH value
> > 
> > Franklin,
> > 
> > Well, I think I already used up all my weekly quota for reviewing patches
> > yesterday... :) But, Ok.
> > 
> > 
> > > * SDK_PATH was previously dynamically determined by using BASHISMS
> > when
> > >   environment-setup was sourced.
> > 
> > But there was still a known good fallback for when not run under bash.
> > 
> > 
> > > * Relocate_sdk.py is required to be ran and the script knows the location of
> > the
> > >   toolchain SDK.
> > > * By having the relocate_sdk script set SDK_PATH we remove the need for
> > >   bashisms from environment-setup.
> > 
> > It is already doing that, no need to change it.
> > 
> > 
> > > diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > > index 699ada7..7f70c42 100644
> > > --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > > +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> > > @@ -7,7 +7,7 @@ TOOLCHAIN_CLEANUP_PACKAGES ?= ""
> > >
> > >  require recipes-core/meta/meta-toolchain.bb
> > >
> > > -PR = "r23"
> > > +PR = "r24"
> > >
> > >  # This function creates an environment-setup-script for use in a deployable
> > SDK
> > >  toolchain_create_sdk_env_script () {
> > > @@ -15,17 +15,7 @@ toolchain_create_sdk_env_script () {
> > >  	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup
> > >  	rm -f $script
> > >  	touch $script
> > > -	echo 'SDK_PATH="${SDKPATH}"' >> $script
> > > -	echo 'if [ -z "$ZSH_NAME" ] && [ "x$0" = "x./environment-setup" ];
> > then' >> $script
> > > -	echo '    echo "Error: This script needs to be sourced. Please run as \".
> > ./environment-setup\""' >> $script
> > > -	echo '    exit 1' >> $script
> > 
> > This portion above may stay - it's a nice safeguard. And there's nothing
> > bashisms about it.
> 
> Your right. I must of gotten delete happy :).
> > 
> > 
> > > -	echo 'else' >> $script
> > > -	echo '    if [ -n "$BASH_SOURCE" ]; then' >> $script
> > > -	echo '        SDK_PATH="`dirname $BASH_SOURCE`"' >> $script
> > > -	echo '    fi' >> $script
> > 
> > I can see potentially removing this portion, since devkit is not relocatable
> > on its own w/o re-installing it in a different location. BTW, this is the only
> > bash-related piece of code here, it just uses bash-specific env variable. If
> > not run under bash, it will safely skip it, so it's not really a bashism.
> True but the SDK_PATH would not be the correct value.
> Current value of SDK_PATH:
> SDK_PATH=/tmp/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx..../yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy...../
> 
> So although no error will be shown the remaining code and variables will be 
> using the incorrect SDK_PATH which results in a lot of issues.

Nope, it will be updated to the correct install path by relocate_sdk.py, as I 
already have the necessary sed line in there - your host-setup script was just 
messing with it... That is what happens when you have too many "smart" scripts 
:) JK

Try it yourself - grab a linux-devkit.sh and install it manually in /tmp, see 
what SDK_PATH in environment-setup is. Don't run any other host-setup scripts 
to update environment-setup any further.


> > > -	echo '    SDK_PATH=`readlink -f "$SDK_PATH"`' >> $script
> > > -	echo '    export SDK_PATH' >> $script
> > > -	echo 'fi' >> $script
> > 
> > And this portion is another nice safeguard - in case you install it in a
> > location that is a symlink.
> That makes sense. This can stay also.
> > 
> > 
> > > +	echo 'export SDK_PATH="${SDKPATH}"' >> $script
> > >  	echo 'export SDK_SYS=${SDK_SYS}' >> $script
> > >  	echo 'export TARGET_SYS=${REAL_MULTIMACH_TARGET_SYS}' >>
> > $script
> > >  	echo 'export TOOLCHAIN_SYS=${TOOLCHAIN_SYS}' >> $script
> > > @@ -234,6 +224,9 @@ for env_setup_script in `ls
> > $target_sdk_dir/environment-setup*`; do
> > >  	$SUDO_EXEC sed -e "s:$TMPSDKPATH:$target_sdk_dir:g" -i
> > $env_setup_script
> > >  done
> > >
> > > +# Correct SDK_PATH since the exact installation path is now known
> > > +$SUDO_EXEC sed -i -e "s|export SDK_PATH\=.*|export
> > SDK_PATH=$target_sdk_dir|g" $target_sdk_dir/environment-setup*
> > 
> > Why do you need this line? It's already happening anyway.
> The only way we get the proper value for SDK_PATH is if the following is executed.
>        SDK_PATH="`dirname $BASH_SOURCE`"' >> $script

Even w/o this code, SDK_PATH is set to the final installation location in the 
first line of the script.


> Since I want to remove that logic the above is required. Although the sed 
> statement would change slightly since "SDK_PATH=" will need to be modified 
> instead of "export SDK_PATH=" since I won't be removing a lot of the safe 
> guard logic.

Again, no changes are required. And the sed line I already have there for 
updating SDK_PATH doesn't care about "export" portion.

-- 
Denys

