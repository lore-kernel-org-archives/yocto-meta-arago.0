Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id CB6AF5298B
	for <meta-arago@arago-project.org>;
	Tue, 21 Jan 2020 20:34:42 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00LKWsQ5027894
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2020 14:32:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579638774;
	bh=vAja5sNiAOkQO2TLkUZhgnRexJMOWSacy7Efqn19mAk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=phwLKjxiJLb2dT6t62be4fZcS6y9/w/E4t+U831wGR3SDdv5ChYqvWDP6prIi/67f
	ajMMQHrZQHVQK8pJEW7BiWYKJRzNLRGZ4kXetNgcqNrbNWj5nFdHLwo5ldhmbPXtem
	TDUGd85btWDCBsbAO/Md4UuilliWYkLCoK2dc3m0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00LKWrRk100687
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2020 14:32:54 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 21 Jan 2020 14:32:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 21 Jan 2020 14:32:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00LKWrH5125588;
	Tue, 21 Jan 2020 14:32:53 -0600
Date: Tue, 21 Jan 2020 15:32:53 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20200121203252.GE31036@beryl>
References: <1579625923-14558-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1579625923-14558-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [RFC][PATCH 1/2] opkg-bash-completion: add simple completions for opkg
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
X-List-Received-Date: Tue, 21 Jan 2020 20:34:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jan 21, 2020 at 11:58:42AM -0500, Jacob Stiffler wrote:
> This is a simpe start to bash completions for opkg. Initialy, this can
> complete current supported verbs (static) and complete package names
> (dynamic).

Oh, nice! Thanks for taking a stab at it!


> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../recipes-devtools/opkg/opkg-bash-completion.bb  | 15 +++++++++++++
>  .../opkg/opkg-bash-completion/opkg-bash-completion | 26 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
>  create mode 100644 meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion/opkg-bash-completion
> 
> diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
> new file mode 100644
> index 0000000..74e4964
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "bash-completions for opkg"
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +SRC_URI = "file://opkg-bash-completion"
> +
> +do_install() {
> +    install -d ${D}${datadir}/bash-completion/completions
> +    install -m 0644 ${WORKDIR}/opkg-bash-completion \
> +                    ${D}${datadir}/bash-completion/completions/opkg
> +}
> +
> +FILES_${PN} = "${datadir}/bash-completion/completions/opkg"
> +RDEPENDS_${PN} = "bash-completion"
> diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion/opkg-bash-completion b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion/opkg-bash-completion
> new file mode 100644
> index 0000000..5b0b4e1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion/opkg-bash-completion
> @@ -0,0 +1,26 @@
> +#!/bin/bash
> +
> +# TBD: parse "opkg --help" to get this list
> +OPKG_COMMANDS="update upgrade install configure remove clean flag list list-installed list-upgradable list-changed-conffiles files search find info status download compare-versions print-architecture depends whatdepends whatdependsrec whatrecommends whatsuggests whatprovides whatconflicts whatreplaces"
> +
> +_opkg_completions() {
> +    if [ ${#COMP_WORDS[@]} -eq 2 ]
> +    then
> +        COMPREPLY=($(compgen -W "${OPKG_COMMANDS}" "${COMP_WORDS[1]}"))
> +        return
> +    fi
> +
> +    # TBD: add more cases, support options
> +    case "${COMP_WORDS[1]}" in
> +        install|files|info|status|download)
> +            COMPREPLY=($(compgen -W "$(opkg list | sed -e 's| .*$||')" -- "${COMP_WORDS[$COMP_CWORD]}"));;
> +        depends|whatdepends|whatdependsrec|whatrecommends|whatsuggests|whatprovides|whatconflicts|whatreplaces)
> +            COMPREPLY=($(compgen -W "-A $(opkg list | sed -e 's| .*$||')" -- "${COMP_WORDS[$COMP_CWORD]}"));;
> +        remove)
> +            COMPREPLY=($(compgen -W "$(opkg list-installed | sed -e 's| .*$||')" -- "${COMP_WORDS[$COMP_CWORD]}"));;
> +        upgrade)
> +            COMPREPLY=($(compgen -W "$(opkg list-upgradable | sed -e 's| .*$||')" -- "${COMP_WORDS[$COMP_CWORD]}"));;
> +    esac
> +}
> +
> +complete -F _opkg_completions opkg
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

