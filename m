Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 261F852A2B
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2012 07:06:38 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qB476bof024278;
	Tue, 4 Dec 2012 01:06:37 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qB476bGu016286;
	Tue, 4 Dec 2012 01:06:37 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Tue, 4 Dec 2012 01:06:37 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [for-comment][PATCH 1/2] sourceipk.bbclass: Add sdk_tweaks
	function
Thread-Index: AQHN0etysQEacVssAEqrBRMrLVXZ5ZgIM1eQ
Date: Tue, 4 Dec 2012 07:06:36 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C33EF4B@DFLE09.ent.ti.com>
References: <1354603735-14377-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1354603735-14377-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [for-comment][PATCH 1/2] sourceipk.bbclass: Add sdk_tweaks function
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
X-List-Received-Date: Tue, 04 Dec 2012 07:06:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

 Any comments on this patch will be greatly appreciated. The function/git b=
ranch names are terrible. I plan on thinking of better names but if you hav=
e any suggestions I would appreciate that also.

The three big issues that this patch is trying to solve are:
1. The git repository being tracked by default points to oe's download dire=
ctory. This results in the git repository being unusable when used on a dif=
ferent computer since the path is no longer valid.
2. The git repository is checked out to ( no branch) since bitbake uses the=
 commit id to checkout out the repository.
3. The biggest benefit of preserving the git repository is the fact that we=
 can now keep track of user's changes to the source files for repositories =
such as u-boot and linux. However, several of these repositories have patch=
es applied on top      of them which results in a dirty work directory befo=
re a user even begins to make changes.

> -----Original Message-----
> From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]
> Sent: Tuesday, December 04, 2012 12:49 AM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [for-comment][PATCH 1/2] sourceipk.bbclass: Add sdk_tweaks funct=
ion
>=20
> * Add sdk_tweaks function.
> * This function does the following:
>     - Correct the remote url from oe's download directory to original git
>       repository specified in the SRC_URI.
>     - Create a branch since oe does a checkout via SRCREV/commit id. This
>       caused the repo to not be in any branch.
>     - Commit any patches applied on top of the git repository
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta-arago-distro/classes/sourceipk.bbclass |   70
> +++++++++++++++++++++++++++
>  1 files changed, 70 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-
> distro/classes/sourceipk.bbclass
> index 09d6eb8..0b5cbdd 100644
> --- a/meta-arago-distro/classes/sourceipk.bbclass
> +++ b/meta-arago-distro/classes/sourceipk.bbclass
> @@ -56,6 +56,12 @@ SRCIPK_SECTION ?=3D "${SECTION}"
>  # Default SRCIPK_INCLUDE_EXTRAFILES is to include the extra files
> SRCIPK_INCLUDE_EXTRAFILES ?=3D "1"
>=20
> +# Commit any changes to the git repository due to patches and create a
> +new # SDK branch CREATE_SDK_BRANCH ?=3D "1"
> +SDK_BRANCH_NAME ?=3D "sdk_05.06.00.00"
> +SDK_BRANCH_COMMIT_MESSAGE =3D "Commit all patches added on top of the
> git repository"
> +
>  # Create a README file that describes the contents of the source ipk
>  sourceipk_create_readme() {
>      readme=3D"$1/README.${PN}-src"
> @@ -71,6 +77,68 @@ sourceipk_create_readme() {
>      echo "      the \"patches\" directory" >> $readme
>  }
>=20
> +# Switch the remote repository pointed to by git from the oe's download
> +# directory to the original git repository specified by the SRC_URI
> +sdk_tweaks() {
> +
> +    source_location=3D$1
> +    save_location=3D$PWD
> +
> +    cd $source_location
> +
> +    if [ -d ".git" ]
> +    then
> +        # Grab the location of the tracked repository
> +        orig_location=3D`git remote -v | grep fetch | cut -c8- | rev |
> + cut -c9- | rev`
> +
> +        # Check if the location of the tracked repository is on the host
> +        # filesystem
> +        if [ -d $orig_location ]
> +        then
> +            cd ${orig_location}
> +            orig_url=3D`git remote -v | grep fetch | cut -c8- | rev | cu=
t
> + -c9- | rev`
> +
> +            cd $source_location
> +            git remote set-url origin ${orig_url}
> +        fi
> +
> +        if [ ${CREATE_SDK_BRANCH} !=3D "0" ]
> +        then
> +            current_branch=3D`git branch | grep \* | cut -b 1-2
> + --complement`
> +
> +            if [ "$current_branch" !=3D "${SDK_BRANCH_NAME}" ]
> +            then
> +                # Create SDK specific branch
> +                git checkout -b ${SDK_BRANCH_NAME} > /dev/null 2>&1
> +            fi
> +
> +            # Commit any changes to the git repository due to patches
> +
> +            # Check to see if the work directory is clean or dirty
> +            if [ -n "$(git status --porcelain)" ]
> +            then
> +                git add -A
> +
> +                if [ "$current_branch" =3D "${SDK_BRANCH_NAME}" ]
> +                then
> +                    # Amend the commit if this function was ran more tha=
n once
> +                    git commit --amend -m "${SDK_BRANCH_COMMIT_MESSAGE}"=
  >
> /dev/null 2>&1
> +                else
> +                    git commit -m "${SDK_BRANCH_COMMIT_MESSAGE}"  >
> /dev/null 2>&1
> +                fi
> +            fi
> +        fi
> +    fi
> +
> +    cd $save_location
> +}
> +
> +do_change_origin() {
> +   sdk_tweaks "${S}"
> +}
> +
> +EXPORT_FUNCTIONS do_change_origin
> +
>  # Create the source ipk file.  The ipk is manually created here instead =
 # of
> using the normal ipk system because some recipes will over write  # the
> PACKAGES variable.  Thus if this class added a -src package @@ -79,6 +147=
,8
> @@ sourceipk_create_readme() {
>  sourceipk_do_create_srcipk() {
>      if [ ${CREATE_SRCIPK} !=3D "0" ]
>      then
> +
> +        do_change_origin
>          tmp_dir=3D"${WORKDIR}/sourceipk-tmp"
>          srcipk_dir=3D"${WORKDIR}/sourceipk-data"
>          mkdir -p $tmp_dir/CONTROL
> --
> 1.7.0.4


