Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E869A52A1A
	for <meta-arago@arago-project.org>;
	Thu, 10 Jan 2013 20:30:44 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0AKUinG019576;
	Thu, 10 Jan 2013 14:30:44 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0AKUiot013015;
	Thu, 10 Jan 2013 14:30:44 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 10 Jan 2013 14:30:44 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [for-comment][PATCH 1/2] sourceipk.bbclass: Add
	sdk_tweaks function
Thread-Index: AQHN0etysQEacVssAEqrBRMrLVXZ5ZgIM1eQgDsLTRA=
Date: Thu, 10 Jan 2013 20:30:43 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C35DB47@DFLE09.ent.ti.com>
References: <1354603735-14377-1-git-send-email-fcooper@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C33EF4B@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C33EF4B@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Thu, 10 Jan 2013 20:30:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You can ignore these patches for now. I found some additional issues that w=
e need to figure out.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, December 04, 2012 1:07 AM
> To: Franklin S. Cooper Jr; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [for-comment][PATCH 1/2] sourceipk.bbclass: Add
> sdk_tweaks function
>=20
>  Any comments on this patch will be greatly appreciated. The function/git
> branch names are terrible. I plan on thinking of better names but if you =
have
> any suggestions I would appreciate that also.
>=20
> The three big issues that this patch is trying to solve are:
> 1. The git repository being tracked by default points to oe's download di=
rectory.
> This results in the git repository being unusable when used on a differen=
t
> computer since the path is no longer valid.
> 2. The git repository is checked out to ( no branch) since bitbake uses t=
he
> commit id to checkout out the repository.
> 3. The biggest benefit of preserving the git repository is the fact that =
we can
> now keep track of user's changes to the source files for repositories suc=
h as u-
> boot and linux. However, several of these repositories have patches appli=
ed on
> top      of them which results in a dirty work directory before a user ev=
en begins
> to make changes.
>=20
> > -----Original Message-----
> > From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]
> > Sent: Tuesday, December 04, 2012 12:49 AM
> > To: meta-arago@arago-project.org
> > Cc: Cooper Jr., Franklin
> > Subject: [for-comment][PATCH 1/2] sourceipk.bbclass: Add sdk_tweaks
> > function
> >
> > * Add sdk_tweaks function.
> > * This function does the following:
> >     - Correct the remote url from oe's download directory to original g=
it
> >       repository specified in the SRC_URI.
> >     - Create a branch since oe does a checkout via SRCREV/commit id. Th=
is
> >       caused the repo to not be in any branch.
> >     - Commit any patches applied on top of the git repository
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  meta-arago-distro/classes/sourceipk.bbclass |   70
> > +++++++++++++++++++++++++++
> >  1 files changed, 70 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-
> > distro/classes/sourceipk.bbclass index 09d6eb8..0b5cbdd 100644
> > --- a/meta-arago-distro/classes/sourceipk.bbclass
> > +++ b/meta-arago-distro/classes/sourceipk.bbclass
> > @@ -56,6 +56,12 @@ SRCIPK_SECTION ?=3D "${SECTION}"
> >  # Default SRCIPK_INCLUDE_EXTRAFILES is to include the extra files
> > SRCIPK_INCLUDE_EXTRAFILES ?=3D "1"
> >
> > +# Commit any changes to the git repository due to patches and create
> > +a new # SDK branch CREATE_SDK_BRANCH ?=3D "1"
> > +SDK_BRANCH_NAME ?=3D "sdk_05.06.00.00"
> > +SDK_BRANCH_COMMIT_MESSAGE =3D "Commit all patches added on top of
> the
> > git repository"
> > +
> >  # Create a README file that describes the contents of the source ipk
> >  sourceipk_create_readme() {
> >      readme=3D"$1/README.${PN}-src"
> > @@ -71,6 +77,68 @@ sourceipk_create_readme() {
> >      echo "      the \"patches\" directory" >> $readme
> >  }
> >
> > +# Switch the remote repository pointed to by git from the oe's
> > +download # directory to the original git repository specified by the
> > +SRC_URI
> > +sdk_tweaks() {
> > +
> > +    source_location=3D$1
> > +    save_location=3D$PWD
> > +
> > +    cd $source_location
> > +
> > +    if [ -d ".git" ]
> > +    then
> > +        # Grab the location of the tracked repository
> > +        orig_location=3D`git remote -v | grep fetch | cut -c8- | rev |
> > + cut -c9- | rev`
> > +
> > +        # Check if the location of the tracked repository is on the ho=
st
> > +        # filesystem
> > +        if [ -d $orig_location ]
> > +        then
> > +            cd ${orig_location}
> > +            orig_url=3D`git remote -v | grep fetch | cut -c8- | rev |
> > + cut
> > + -c9- | rev`
> > +
> > +            cd $source_location
> > +            git remote set-url origin ${orig_url}
> > +        fi
> > +
> > +        if [ ${CREATE_SDK_BRANCH} !=3D "0" ]
> > +        then
> > +            current_branch=3D`git branch | grep \* | cut -b 1-2
> > + --complement`
> > +
> > +            if [ "$current_branch" !=3D "${SDK_BRANCH_NAME}" ]
> > +            then
> > +                # Create SDK specific branch
> > +                git checkout -b ${SDK_BRANCH_NAME} > /dev/null 2>&1
> > +            fi
> > +
> > +            # Commit any changes to the git repository due to patches
> > +
> > +            # Check to see if the work directory is clean or dirty
> > +            if [ -n "$(git status --porcelain)" ]
> > +            then
> > +                git add -A
> > +
> > +                if [ "$current_branch" =3D "${SDK_BRANCH_NAME}" ]
> > +                then
> > +                    # Amend the commit if this function was ran more t=
han once
> > +                    git commit --amend -m
> > + "${SDK_BRANCH_COMMIT_MESSAGE}"  >
> > /dev/null 2>&1
> > +                else
> > +                    git commit -m "${SDK_BRANCH_COMMIT_MESSAGE}"  >
> > /dev/null 2>&1
> > +                fi
> > +            fi
> > +        fi
> > +    fi
> > +
> > +    cd $save_location
> > +}
> > +
> > +do_change_origin() {
> > +   sdk_tweaks "${S}"
> > +}
> > +
> > +EXPORT_FUNCTIONS do_change_origin
> > +
> >  # Create the source ipk file.  The ipk is manually created here
> > instead  # of using the normal ipk system because some recipes will
> > over write  # the PACKAGES variable.  Thus if this class added a -src
> > package @@ -79,6 +147,8 @@ sourceipk_create_readme() {
> >  sourceipk_do_create_srcipk() {
> >      if [ ${CREATE_SRCIPK} !=3D "0" ]
> >      then
> > +
> > +        do_change_origin
> >          tmp_dir=3D"${WORKDIR}/sourceipk-tmp"
> >          srcipk_dir=3D"${WORKDIR}/sourceipk-data"
> >          mkdir -p $tmp_dir/CONTROL
> > --
> > 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

