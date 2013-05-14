Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id 39AE852976
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2013 18:12:06 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MMS00GYBVVK4L20@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 14 May 2013 13:11:45 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6C3B82003E; Tue,
	14 May 2013 14:11:44 -0400 (EDT)
Date: Tue, 14 May 2013 14:11:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: zhoujt@ti.com
Message-id: <20130514181144.GF31835@denix.org>
References: <1367511838-905-1-git-send-email-zhoujt@ti.com>
MIME-version: 1.0
In-reply-to: <1367511838-905-1-git-send-email-zhoujt@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] fixed the syslog-ng to work in yocto
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
X-List-Received-Date: Tue, 14 May 2013 18:12:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 02, 2013 at 12:23:58PM -0400, zhoujt@ti.com wrote:
> From: Jingting Zhou <a0221004@ares-ubuntu>

Same comments as with previous patch, although commit description here should 
be more extended - "fixed syslog-ng to work in yocto" is not the correct one. 
Add a short description of what you're changing (packaging plugins separately) 
and then, if needed, a more detailed explanation of what and why you are 
making changes.


> 
> ---
>  .../packagegroup-arago-base-tisdk-server-extra.bb  |    1 +
>  .../recipes-bsp/syslog-ng/syslog-ng.inc            |   31 ++++++++++++++++----
>  2 files changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> index 6dbf8ee..46db7c2 100755
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> @@ -66,6 +66,7 @@ RDEPENDS_${PN} = "\
>      ptpd \
>      vsftpd \
>      syslog-ng \	
> +	syslog-ng-plugins \

Please keep the whitespaces consistent. The above lines use spaces and you add 
a line that uses tabs.


>      dtc \
>      strongswan \ 
>      strongswan-plugins \ 
> diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
> index 584e4a4..5e3e41d 100755
> --- a/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
> +++ b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
> @@ -7,12 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7ec1bcc46f28b11f4722e20d9b7dd4d5"
>  # update-rc.d and update-alternatives is important
>  RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
>  
> -INC_PR = "r9"
> +INC_PR = "r10"
>  
>  inherit autotools
>  
>  SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source/${PN}_${PV}.tar.gz"
> -
> + 

^^^^^^^ Extra whitespace at the end of the line - even git will complain about 
this.


>  noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6', d)}"
>  
>  EXTRA_OECONF = " \
> @@ -25,14 +25,25 @@ EXTRA_OECONF = " \
>    --disable-linux-caps \
>    --disable-pcre \
>    --disable-sql \
> +  --disable-tcp-wrapper \
>  "
> +# disabled tcp-wrapper lib

It is possible to comment out things like that, if you plan on reverting the 
change later. Otherwise it's better to just delete the line.


> -do_configure_prepend() {
> -        eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
> +do_configure_prepend() { 
> +		eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"

What is the change here? Seems the first line adds a space at the end and the 
second one changes the whitespace indentation. Is it on purpose?


>  }
>  
>  # rename modules.conf because it breaks update-modules 
>  # see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035537.html
> +
> +do_compile_prepend() {
> +	cd ${WORKDIR}/syslog-ng-3.2.5/
> +	sed -i "s/\#define PATH\_MODULEDIR \"\/usr\/lib\/syslog-ng\"/\#define PATH\_MODULEDIR \"\/usr\/lib\/syslog-ng\/plugins\"/" config.h
> +	cd -

No need to cd in and cd out. Just sed directly in the file.


> +}
> +
> +# changed the default PATH_MODULEDIR, added an extra level

Any particular reason for the above?


> +
>  do_install_append() {
>          mv ${D}/${sysconfdir}/modules.conf ${D}/${sysconfdir}/scl-modules.conf
>          sed -i "s#@include 'modules.conf'#@include 'scl-modules.conf'#g" ${D}/${sysconfdir}/scl.conf
> @@ -40,14 +51,23 @@ do_install_append() {
>          install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf
>          install -d ${D}/${sysconfdir}/init.d
>          install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
> +		mkdir ${D}/${libdir}/syslog-ng/plugins/
> +		mv ${D}/${libdir}/syslog-ng/*.so ${D}/${libdir}/syslog-ng/plugins/

Whitespaces.


>  }
>  
> +PACKAGES += "${PN}-plugins"
> +FILES_${PN}-plugins += "${libdir}/syslog-ng/plugins/*.so"
> +INSANE_SKIP_${PN}-plugins = "dev-so"
> +
> +# somehow the yocto doesn't allow so files in ${libdir}/syslog-ng/*.so, add another plugins level as in strongswan package

Hmm, can you provide more specifics to the above statement? Was there an error 
message? What was the prooblem? I would understand *.so from ${libdir} 
automatically going to ${PN}-dev, but not from ${libdir}/syslog-ng/


>  FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
>              ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>              ${base_bindir}/* ${base_sbindir}/* \
>              ${base_libdir}/*${SOLIBS} \
> -            ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \

The part you are removing ${libdir}/${BPN}/*${SOLIBS} was responsible for 
packaging /usr/lib/syslog-ng/*.so.* files into the main package. That would 
cover versioned libraries, but not unversioned .so ones, such as plugins.


> +            ${datadir}/${BPN} \
>              ${datadir}/include/scl/ ${datadir}/xsd"
> +			
>  FILES_${PN}-dev += "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIBSDEV}"

And this line has ${libdir}/${BPN}/*${SOLIBSDEV}, that translates into:
/usr/lib/syslog-ng/*.so that would package your plugins into the syslog-ng-dev 
package, before you moved them to one level deeper. So, I would suggest 
reworking this patch to create ${PN}-plugins (syslog-ng-plugins) package like 
you started, but not necessarily moving them into a separate directory...


>  CONFFILES_${PN} = "${sysconfdir}/${PN}.conf ${sysconfdir}/scl.conf ${sysconfdir}/scl-modules.conf"
>  
> @@ -88,3 +108,4 @@ pkg_postrm_${PN} () {
>                  fi
>          fi
>  }
> +

Empty line at the end of the file? Not that it's critical, but git will 
complain here as well...

-- 
Denys

