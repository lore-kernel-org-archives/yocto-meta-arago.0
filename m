Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3490952A31;
	Tue, 22 Jul 2014 21:21:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6MLLaUU013644;
	Tue, 22 Jul 2014 16:21:36 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6MLLa7W023951;
	Tue, 22 Jul 2014 16:21:36 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 22 Jul 2014 16:21:36 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"arago-commits@arago-project.org" <arago-commits@arago-project.org>
Thread-Topic: [arago-commits] Maupin,	Chase : sourceipk: allow packaging
	shallow git clone
Thread-Index: AQHPorXk82tSQ7MFG0uVlI2C+h6BgZusnmcA
Date: Tue, 22 Jul 2014 21:21:35 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E83DB@DFLE08.ent.ti.com>
References: <20140718182654.0481952A2D@arago-project.org>
In-Reply-To: <20140718182654.0481952A2D@arago-project.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [arago-commits] Maupin, Chase : sourceipk: allow packaging shallow git clone
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
X-List-Received-Date: Tue, 22 Jul 2014 21:21:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

FYI I had to update my bitbake to the latest commits in the 1.22 branch for=
 this to work for some reason....

So if you see the below error try upgrading bitbake.

/home/franklin/oe/mainline/build/arago-tmp-external-linaro-toolchain/work/c=
ortexa8t2hf-vfp-neon-oe-linux-gnueabi/ti-crypto-examples/git-r7/temp/run.do=
_create_srcipk.11714: line 202: get_remote: command not found
| WARNING: /home/franklin/oe/mainline/build/arago-tmp-external-linaro-toolc=
hain/work/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/ti-crypto-examples/git-r7/=
temp/run.do_create_srcipk.11714:1 exit 127 from
|   local_repo=3D`get_remote $PWD`
| ERROR: Function failed: do_create_srcipk (log file is located at /home/fr=
anklin/oe/mainline/build/arago-tmp-external-linaro-toolchain/work/cortexa8t=
2hf-vfp-neon-oe-linux-gnueabi/ti-crypto-examples/git-r7/temp/log.do_create_=
srcipk.11714)
ERROR: Task 2026 (/home/franklin/oe/mainline/sources/meta-arago/meta-arago-=
extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb, do_create=
_srcipk) failed with exit code '1'
ERROR: Function failed: do_create_srcipk (log file is located at /home/fran=
klin/oe/mainline/build/arago-tmp-external-linaro-toolchain/work/cortexa8t2h=
f-vfp-neon-oe-linux-gnueabi/arm-benchmarks/1.3-r7-arago0/temp/log.do_create=
_srcipk.11790)
ERROR: Logfile of failure stored in: /home/franklin/oe/mainline/build/arago=
-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/=
arm-benchmarks/1.3-r7-arago0/temp/log.do_create_srcipk.11790
Log data follows:
> -----Original Message-----
> From: arago-commits-bounces@arago-project.org [mailto:arago-commits-
> bounces@arago-project.org] On Behalf Of Arago Project git
> Sent: Friday, July 18, 2014 2:27 PM
> To: arago-commits@arago-project.org
> Subject: [arago-commits] Maupin, Chase : sourceipk: allow packaging shall=
ow
> git clone
>=20
> Module: meta-arago
> Branch: master
> Commit: 17a0985acfa6db950025be99ad65713e44f1b358
> URL:    http://arago-project.org/git/meta-
> arago.git?a=3Dcommit;h=3D17a0985acfa6db950025be99ad65713e44f1b358
>=20
> Author: Maupin, Chase <chase.maupin@ti.com>
> Date:   Sat Jul 19 00:17:54 2014 +0000
>=20
> sourceipk: allow packaging shallow git clone
>=20
> * Add another flag SRCIPK_SHALLOW_CLONE that will do a shallow
>   clone of depth 1 to reduce the size of the git history.
>     * The full history can be fetched again using either of the
>       following commands based on the version of git being used
>         - git pull --unshallow (New git versions)
>         - git pull (older git versions)
> * Clean up some of the variable names to make it more clear what
>   they are storing.
> * Create a generic function to determine the fetch reporitory
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>=20
> ---
>=20
>  meta-arago-distro/classes/sourceipk.bbclass |   97
> ++++++++++++++++++++++++---
>  1 files changed, 86 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-
> distro/classes/sourceipk.bbclass
> index 20dda76..8fef2e9 100644
> --- a/meta-arago-distro/classes/sourceipk.bbclass
> +++ b/meta-arago-distro/classes/sourceipk.bbclass
> @@ -61,32 +61,108 @@ SRCIPK_INCLUDE_EXTRAFILES ?=3D "1"
>=20
>  SRCIPK_PRESERVE_GIT ?=3D "false"
>=20
> -adjust_git() {
> +# Create a shallow clone of the git repository to reduce the size of #
> +the sourceipk SRCIPK_SHALLOW_CLONE ?=3D "false"
> +
> +# This function will return the fetch URL for a git repository passed
> +as # the first parameter.
> +get_remote() {
> +    git_repo=3D"$1"
> +
> +    if [ "$git_repo" =3D=3D "" ]
> +    then
> +        echo "git_repo not passed to get_remote"
> +        exit 1
> +    fi
> +
> +    cd $git_repo
> +
> +    # Get the remote repository fetch URL
> +    remote=3D`git remote -v | grep "(fetch)" | cut -d ' ' -f 1   | cut -=
c 7- | tr -d ' '`
> +
> +    # Since the echo'ed value of this statment is the returned value red=
irect
> +    # the output of this command to /dev/null
> +    cd - > /dev/null
> +
> +    # echo back the remote repository URL as the output of this function
> +    echo $remote
> +
> +    return 0
> +}
> +
> +# Some git repositories are very large and we do not want to ship the #
> +full history.  Instead we want to limit history to reduce the size
> +while # still keeping the git repository in place.  The full history
> +can be # fetched using git pull --unshallow or just git pull # NOTE:
> +This function depends on a git version >=3D 1.7.10.  It will work
> +#       with older versions but the size will be larger because rather
> +#       than just a single branch the limited history will be a depth of
> +#       1 for all branches and tags.
> +limit_git_history() {
> +    # By default limit the history to 1 commit since the user can always
> +    # use git pull --unshallow to fetch the rest of history.  The depth
> +    # level of 1 is set to keep from tracking through all merges and
> +    # pulling excess history
> +    commits=3D"1"
> +
> +    # Temporary directory to make shallow clones in
> +    gitshallowclone=3D"${WORKDIR}/temp-git-shallow-clone"
> +
> +    # Change directory to the git repository to be safe
> +    cd $tmp_dir/${SRCIPK_INSTALL_DIR}
>=20
> +    # Create a temporary directory to hold the shallow git clone
> +    mkdir -p $gitshallowclone
> +
> +    remote=3D`get_remote $PWD`
> +
> +    git clone --depth $commits --branch ${BRANCH} file://$remote
> + $gitshallowclone
> +
> +    # remove original kernel clone since we will replace it with the sha=
llow
> +    # clone
> +    rm -rf $tmp_dir/${SRCIPK_INSTALL_DIR}/.git
> +
> +    # replace the original kernel git data with the shallow clone git da=
ta
> +    mv $gitshallowclone/.git $tmp_dir/${SRCIPK_INSTALL_DIR}/
> +    rm -rf $gitshallowclone
> +
> +    cd -
> +}
> +
> +adjust_git() {
>      orig_dir=3D"$PWD"
>=20
>      cd $tmp_dir/${SRCIPK_INSTALL_DIR}
>=20
>      if [ -d ".git" ]
>      then
> +        # Get the location of the local repository
> +        local_repo=3D`get_remote $PWD`
>=20
> -        # Grab path to cloned local repository
> -        old=3D`git remote -v | grep "(fetch)" | cut -d ' ' -f 1   | cut =
-c 7- | tr -d ' '`
> -
> -        if [ -d $old -a "${SRCIPK_PRESERVE_GIT}" =3D "true" ]
> +        if [ -d $local_repo -a "${SRCIPK_PRESERVE_GIT}" =3D "true" ]
>          then
> -            cd $old
> +            cd $local_repo
> +
> +            # If SRCIPK_SHALLOW_CLONE is true then make a shallow copy o=
f the
> +            # git repository and then fix up the git URLs
> +            if [ "${SRCIPK_SHALLOW_CLONE}" =3D=3D "true" ]
> +            then
> +                limit_git_history
> +            fi
>=20
>              # Grab actual url used to create the repository
> -            orig=3D`git remote -v | grep "(fetch)" | cut -d ' ' -f 1   |=
 cut -c 7- | tr -d ' '`
> +            remote_repo=3D`get_remote $PWD`
>=20
>              cd -
>=20
> -            git remote set-url origin $orig $old
> +            git remote set-url origin $remote_repo $local_repo
>=20
> -            # Repackage the repository so its a proper clone of the orig=
inal
> (remote) git repository
> +            # Repackage the repository so its a proper clone of the orig=
inal
> +            # (remote) git repository
>              git repack -a -d
> -            rm .git/objects/info/alternates
> +
> +            rm -f .git/objects/info/alternates
>=20
>          else
>              rm -rf .git
> @@ -95,7 +171,6 @@ adjust_git() {
>      fi
>=20
>      cd $orig_dir
> -
>  }
>=20
>  # Create a README file that describes the contents of the source ipk
>=20
> _______________________________________________
> arago-commits mailing list
> arago-commits@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/arago-commits

