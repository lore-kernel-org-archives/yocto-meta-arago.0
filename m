Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E7239529F2
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 15:03:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6IF3Wg1015636
	for <meta-arago@arago-project.org>; Fri, 18 Jul 2014 10:03:32 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6IF3VTS015250
	for <meta-arago@arago-project.org>; Fri, 18 Jul 2014 10:03:32 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 18 Jul 2014 10:03:31 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/4] sourceipk: allow packaging shallow
	git	clone
Thread-Index: AQHPoB/1qy2iXDFnKk6HPiRAj7uidpuiv3dQgAMyaaA=
Date: Fri, 18 Jul 2014 15:03:30 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D153D0A@DLEE11.ent.ti.com>
References: <1405423715-21885-1-git-send-email-Chase.Maupin@ti.com>
	<1405423715-21885-2-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C6E348E@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6E348E@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 18 Jul 2014 15:03:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Cooper Jr., Franklin
>Sent: Wednesday, July 16, 2014 9:19 AM
>To: Maupin, Chase; meta-arago@arago-project.org
>Subject: RE: [meta-arago] [PATCH 1/4] sourceipk: allow packaging
>shallow git clone
>
>What branch/commit is checked out by default when a user uses this
>shallow cloned git repository?
>Also since your manually cloning this repository what happens to
>patches that OE applies to the git repository or files that are
>manually copied?

Default is that the ${BRANCH} is checked out at the ${SRCREV}.

The copied files like the config are still maintained because we replace th=
e git data in the original sourceipk directory rather than doing a whole ne=
w copy.  So if the files were there before they are still there vs. doing a=
 new checkout where they would be lost.

>
>I'm not sure if it is possible but it is probably safer to reuse
>the git repository as is from sourceipk and see if we can make
>that git repository shallow so we can preserve any changes to the
>repo.

I had not found a way to take an existing repo and turn it into a shallow c=
lone.  That is why I make the shallow clone separate and then replace the g=
it repo with the shallow clone data.

>
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Maupin, Chase
>> Sent: Tuesday, July 15, 2014 6:29 AM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [PATCH 1/4] sourceipk: allow packaging
>shallow git
>> clone
>>
>> * Add another flag SRCIPK_SHALLOW_CLONE that will do a shallow
>>   clone of depth 1 to reduce the size of the git history.
>>     * The full history can be fetched again using either of the
>>       following commands based on the version of git being used
>>         - git pull --unshallow (New git versions)
>>         - git pull (older git versions)
>> * Clean up some of the variable names to make it more clear what
>>   they are storing.
>> * Create a generic function to determine the fetch reporitory
>>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>  meta-arago-distro/classes/sourceipk.bbclass |  100
>> ++++++++++++++++++++++++---
>>  1 file changed, 89 insertions(+), 11 deletions(-)
>>
>> diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-
>arago-
>> distro/classes/sourceipk.bbclass
>> index 20dda76..33878ac 100644
>> --- a/meta-arago-distro/classes/sourceipk.bbclass
>> +++ b/meta-arago-distro/classes/sourceipk.bbclass
>> @@ -61,32 +61,111 @@ SRCIPK_INCLUDE_EXTRAFILES ?=3D "1"
>>
>>  SRCIPK_PRESERVE_GIT ?=3D "false"
>>
>> -adjust_git() {
>> +# Create a shallow clone of the git repository to reduce the
>size of #
>> +the sourceipk SRCIPK_SHALLOW_CLONE ?=3D "false"
>> +
>> +# This function will return the fetch URL for a git repository
>passed
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
>> +    remote=3D`git remote -v | grep "(fetch)" | cut -d ' ' -f 1
>| cut -c 7- | tr -d ' '`
>> +
>> +    # Since the echo'ed value of this statment is the returned
>value redirect
>> +    # the output of this command to /dev/null
>> +    cd - > /dev/null
>> +
>> +    # echo back the remote repository URL as the output of this
>function
>> +    echo $remote
>> +
>> +    return 0
>> +}
>> +
>> +# Some git repositories are very large and we do not want to
>ship the #
>> +full history.  Instead we want to limit history to reduce the
>size
>> +while # still keeping the git repository in place.  The full
>history
>> +can be # fetched using git pull --unshallow or just git pull #
>NOTE:
>> +This function depends on a git version >=3D 1.7.10.  It will work
>> +#       with older versions but the size will be larger because
>rather
>> +#       than just a single branch the limited history will be a
>depth of
>> +#       1 for all branches and tags.
>> +limit_git_history() {
>> +    # By default limit the history to 1 commit since the user
>can always
>> +    # use git pull --unshallow to fetch the rest of history.
>The depth
>> +    # level of 1 is set to keep from tracking through all
>merges and
>> +    # pulling excess history
>> +    commits=3D"1"
>> +
>> +    # Temporary directory to make shallow clones in
>> +    gitshallowclone=3D"${WORKDIR}/temp-git-shallow-clone"
>> +
>> +    # Change directory to the git repository to be safe
>> +    cd $tmp_dir/${SRCIPK_INSTALL_DIR}
>> +
>> +    # Create a temporary directory to hold the shallow git
>clone
>> +    mkdir -p $gitshallowclone
>>
>> +    remote=3D`get_remote $PWD`
>> +
>> +    git clone --depth $commits --branch ${BRANCH}
>file://$remote
>> + $gitshallowclone
>> +
>> +    # remove original kernel clone since we will replace it
>with the shallow
>> +    # clone
>> +    rm -rf $tmp_dir/${SRCIPK_INSTALL_DIR}/.git
>> +
>> +    # replace the original kernel git data with the shallow
>clone git data
>> +    mv $gitshallowclone/.git $tmp_dir/${SRCIPK_INSTALL_DIR}/
>> +    rm -rf $gitshallowclone
>> +
>> +    cd -
>> +}
>> +
>> +adjust_git() {
>>      orig_dir=3D"$PWD"
>>
>>      cd $tmp_dir/${SRCIPK_INSTALL_DIR}
>>
>>      if [ -d ".git" ]
>>      then
>> +        # Get the location of the local repository
>> +        local_repo=3D`get_remote $PWD`
>>
>> -        # Grab path to cloned local repository
>> -        old=3D`git remote -v | grep "(fetch)" | cut -d ' ' -f 1
>| cut -c 7- | tr -d ' '`
>> -
>> -        if [ -d $old -a "${SRCIPK_PRESERVE_GIT}" =3D "true" ]
>> +        if [ -d $local_repo -a "${SRCIPK_PRESERVE_GIT}" =3D
>"true" ]
>>          then
>> -            cd $old
>> +            cd $local_repo
>> +
>> +            # If SRCIPK_SHALLOW_CLONE is true then make a
>shallow copy of the
>> +            # git repository and then fix up the git URLs
>> +            if [ "${SRCIPK_SHALLOW_CLONE}" =3D=3D "true" ]
>> +            then
>> +                limit_git_history
>> +            fi
>>
>>              # Grab actual url used to create the repository
>> -            orig=3D`git remote -v | grep "(fetch)" | cut -d ' ' -
>f 1   | cut -c 7- | tr -d ' '`
>> +            remote_repo=3D`get_remote $PWD`
>>
>>              cd -
>>
>> -            git remote set-url origin $orig $old
>> +            git remote set-url origin $remote_repo $local_repo
>>
>> -            # Repackage the repository so its a proper clone of
>the original
>> (remote) git repository
>> +            # Repackage the repository so its a proper clone of
>the original
>> +            # (remote) git repository
>>              git repack -a -d
>> -            rm .git/objects/info/alternates
>> +
>> +            if [ -e .git/objects/info/alternates ]
>> +            then
>> +                rm .git/objects/info/alternates
>> +            fi
>>
>>          else
>>              rm -rf .git
>> @@ -95,7 +174,6 @@ adjust_git() {
>>      fi
>>
>>      cd $orig_dir
>> -
>>  }
>>
>>  # Create a README file that describes the contents of the
>source ipk
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

