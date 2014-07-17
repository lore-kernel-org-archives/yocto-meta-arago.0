Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E91F8529DD
	for <meta-arago@arago-project.org>;
	Thu, 17 Jul 2014 17:23:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6HHNwts026955
	for <meta-arago@arago-project.org>; Thu, 17 Jul 2014 12:23:58 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6HHNwBr013832
	for <meta-arago@arago-project.org>; Thu, 17 Jul 2014 12:23:58 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 17 Jul 2014 12:23:58 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/4] sourceipk: allow packaging shallow
	git	clone
Thread-Index: AQHPoB/1qy2iXDFnKk6HPiRAj7uidpuiv3dQgAHIEdE=
Date: Thu, 17 Jul 2014 17:23:57 +0000
Message-ID: <6FACBCC6-8B06-4C46-9CB5-FC4B4B0A8209@ti.com>
References: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
	<1405423715-21885-2-git-send-email-Chase.Maupin@ti.com>,
	<8F29D6B095ED194EA1980491A5E029710C6E348E@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6E348E@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/4] sourceipk: allow packaging shallow git	clone
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
X-List-Received-Date: Thu, 17 Jul 2014 17:23:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I will reply to this in detail later. I'm traveling and in meetings. But ye=
s, extra files are preserved.=20
> On Jul 16, 2014, at 9:19 AM, "Cooper Jr., Franklin" <fcooper@ti.com> wrot=
e:
>=20
> What branch/commit is checked out by default when a user uses this shallo=
w cloned git repository?
> Also since your manually cloning this repository what happens to patches =
that OE applies to the git repository or files that are manually copied?
>=20
> I'm not sure if it is possible but it is probably safer to reuse the git =
repository as is from sourceipk and see if we can make that git repository =
shallow so we can preserve any changes to the repo.
>=20
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Maupin, Chase
>> Sent: Tuesday, July 15, 2014 6:29 AM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [PATCH 1/4] sourceipk: allow packaging shallow git
>> clone
>>=20
>> * Add another flag SRCIPK_SHALLOW_CLONE that will do a shallow
>>  clone of depth 1 to reduce the size of the git history.
>>    * The full history can be fetched again using either of the
>>      following commands based on the version of git being used
>>        - git pull --unshallow (New git versions)
>>        - git pull (older git versions)
>> * Clean up some of the variable names to make it more clear what
>>  they are storing.
>> * Create a generic function to determine the fetch reporitory
>>=20
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>> meta-arago-distro/classes/sourceipk.bbclass |  100
>> ++++++++++++++++++++++++---
>> 1 file changed, 89 insertions(+), 11 deletions(-)
>>=20
>> diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-
>> distro/classes/sourceipk.bbclass
>> index 20dda76..33878ac 100644
>> --- a/meta-arago-distro/classes/sourceipk.bbclass
>> +++ b/meta-arago-distro/classes/sourceipk.bbclass
>> @@ -61,32 +61,111 @@ SRCIPK_INCLUDE_EXTRAFILES ?=3D "1"
>>=20
>> SRCIPK_PRESERVE_GIT ?=3D "false"
>>=20
>> -adjust_git() {
>> +# Create a shallow clone of the git repository to reduce the size of #
>> +the sourceipk SRCIPK_SHALLOW_CLONE ?=3D "false"
>> +
>> +# This function will return the fetch URL for a git repository passed
>> +as # the first parameter.
>> +get_remote() {
>> +    git_repo=3D"$1"
>> +
>> +    if [ "$git_repo" =3D=3D "" ]
>> +    then
>> +        echo "git_repo not passed to get_remote"
>> +        exit 1
>> +    fi
>> +
>> +    cd $git_repo
>> +
>> +    # Get the remote repository fetch URL
>> +    remote=3D`git remote -v | grep "(fetch)" | cut -d ' ' -f 1   | cut =
-c 7- | tr -d ' '`
>> +
>> +    # Since the echo'ed value of this statment is the returned value re=
direct
>> +    # the output of this command to /dev/null
>> +    cd - > /dev/null
>> +
>> +    # echo back the remote repository URL as the output of this functio=
n
>> +    echo $remote
>> +
>> +    return 0
>> +}
>> +
>> +# Some git repositories are very large and we do not want to ship the #
>> +full history.  Instead we want to limit history to reduce the size
>> +while # still keeping the git repository in place.  The full history
>> +can be # fetched using git pull --unshallow or just git pull # NOTE:
>> +This function depends on a git version >=3D 1.7.10.  It will work
>> +#       with older versions but the size will be larger because rather
>> +#       than just a single branch the limited history will be a depth o=
f
>> +#       1 for all branches and tags.
>> +limit_git_history() {
>> +    # By default limit the history to 1 commit since the user can alway=
s
>> +    # use git pull --unshallow to fetch the rest of history.  The depth
>> +    # level of 1 is set to keep from tracking through all merges and
>> +    # pulling excess history
>> +    commits=3D"1"
>> +
>> +    # Temporary directory to make shallow clones in
>> +    gitshallowclone=3D"${WORKDIR}/temp-git-shallow-clone"
>> +
>> +    # Change directory to the git repository to be safe
>> +    cd $tmp_dir/${SRCIPK_INSTALL_DIR}
>> +
>> +    # Create a temporary directory to hold the shallow git clone
>> +    mkdir -p $gitshallowclone
>>=20
>> +    remote=3D`get_remote $PWD`
>> +
>> +    git clone --depth $commits --branch ${BRANCH} file://$remote
>> + $gitshallowclone
>> +
>> +    # remove original kernel clone since we will replace it with the sh=
allow
>> +    # clone
>> +    rm -rf $tmp_dir/${SRCIPK_INSTALL_DIR}/.git
>> +
>> +    # replace the original kernel git data with the shallow clone git d=
ata
>> +    mv $gitshallowclone/.git $tmp_dir/${SRCIPK_INSTALL_DIR}/
>> +    rm -rf $gitshallowclone
>> +
>> +    cd -
>> +}
>> +
>> +adjust_git() {
>>     orig_dir=3D"$PWD"
>>=20
>>     cd $tmp_dir/${SRCIPK_INSTALL_DIR}
>>=20
>>     if [ -d ".git" ]
>>     then
>> +        # Get the location of the local repository
>> +        local_repo=3D`get_remote $PWD`
>>=20
>> -        # Grab path to cloned local repository
>> -        old=3D`git remote -v | grep "(fetch)" | cut -d ' ' -f 1   | cut=
 -c 7- | tr -d ' '`
>> -
>> -        if [ -d $old -a "${SRCIPK_PRESERVE_GIT}" =3D "true" ]
>> +        if [ -d $local_repo -a "${SRCIPK_PRESERVE_GIT}" =3D "true" ]
>>         then
>> -            cd $old
>> +            cd $local_repo
>> +
>> +            # If SRCIPK_SHALLOW_CLONE is true then make a shallow copy =
of the
>> +            # git repository and then fix up the git URLs
>> +            if [ "${SRCIPK_SHALLOW_CLONE}" =3D=3D "true" ]
>> +            then
>> +                limit_git_history
>> +            fi
>>=20
>>             # Grab actual url used to create the repository
>> -            orig=3D`git remote -v | grep "(fetch)" | cut -d ' ' -f 1   =
| cut -c 7- | tr -d ' '`
>> +            remote_repo=3D`get_remote $PWD`
>>=20
>>             cd -
>>=20
>> -            git remote set-url origin $orig $old
>> +            git remote set-url origin $remote_repo $local_repo
>>=20
>> -            # Repackage the repository so its a proper clone of the ori=
ginal
>> (remote) git repository
>> +            # Repackage the repository so its a proper clone of the ori=
ginal
>> +            # (remote) git repository
>>             git repack -a -d
>> -            rm .git/objects/info/alternates
>> +
>> +            if [ -e .git/objects/info/alternates ]
>> +            then
>> +                rm .git/objects/info/alternates
>> +            fi
>>=20
>>         else
>>             rm -rf .git
>> @@ -95,7 +174,6 @@ adjust_git() {
>>     fi
>>=20
>>     cd $orig_dir
>> -
>> }
>>=20
>> # Create a README file that describes the contents of the source ipk
>> --
>> 1.7.9.5
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

