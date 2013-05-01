Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 364D552A65
	for <meta-arago@arago-project.org>;
	Wed,  1 May 2013 22:49:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r41Mn8eu022458
	for <meta-arago@arago-project.org>; Wed, 1 May 2013 17:49:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r41Mn8Xv012132
	for <meta-arago@arago-project.org>; Wed, 1 May 2013 17:49:08 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 1 May 2013 17:49:07 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r41Mn7ak009961;
	Wed, 1 May 2013 17:49:08 -0500
Date: Wed, 1 May 2013 18:49:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>
Message-ID: <20130501224906.GH32449@edge>
References: <3C08AEEB3C731745938BC83D029FE5E3944A28@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <3C08AEEB3C731745938BC83D029FE5E3944A28@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: patch to fix syslog-ng module-path problem in yocto
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
X-List-Received-Date: Wed, 01 May 2013 22:49:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jingting,

First of all, thanks for the patch! Please keep them coming.

Now, see my comments inline.


On Wed, May 01, 2013 at 10:19:47PM +0000, Zhou, Jingting wrote:
> Hey all, the current syslog-ng recipe in meta-openembedded have the 
> following problem,
> 
> root@keystone-evm:/usr/lib/syslog-ng# syslog-ng
> Plugin module not found in 'module-path'; module-path='/usr/lib/syslog-ng', modu                    le='syslogformat'
> Plugin module not found in 'module-path'; module-path='/usr/lib/syslog-ng', modu                    le='basicfuncs'
> Plugin module not found in 'module-path'; module-path='/usr/lib/syslog-ng', modu                    le='afsocket'
> Plugin module not found in 'module-path'; module-path='/usr/lib/syslog-ng', modu                    le='affile'
> Plugin module not found in 'module-path'; module-path='/usr/lib/syslog-ng', modu                    le='afprog'
> Plugin module not found in 'module-path'; module-path='/usr/lib/syslog-ng', modu                    le='afuser'
> Plugin module not found in 'module-path'; module-path='/usr/lib/syslog-ng', modu                    le='dbparser'
> Plugin module not found in 'module-path'; module-path='/usr/lib/syslog-ng', modu                    le='csvparser'
> Error parsing source, source plugin unix-dgram not found in /etc/syslog-ng.conf                     at line 19, column 16:
> 
> source s_src { unix-dgram("/dev/log"); internal();
> 
> This is because the yocto doesn't allow the so files in the main 
> package(under /usr/lib/syslog-ng/).

Well, this is not the correct assesment! By default, /usr/lib/lib*.so 
automatically go into ${PN}-dev, which is actually a good thing. But syslog-ng 
plugins are anyway installed in a separate directory, so the comment above 
does not really apply.

So, I see that you are altering the recipe from meta-oe to create a 
${PN}-plugins package with those plugin .so files and install it in the image. 
Are there any other changes to the default recipe from meta-oe?

Also, can this be done as a .bbappend to the original recipe instead of 
copying all the contents to meta-arago, while modifying it. So, I would 
definitely recommend looking into making it a simple .bbappend with just the 
changes.

But for the future, when you really need to overlay the entire recipe locally 
in meta-arago for making changes, please split it in 2 commits/patches - first 
to add unmodified files in to meta-arago from another layer, and then 
separately a patch to apply your changes on top. This way it's much clearer 
what is changing and why - easier to review.


> Here's the patch,

BTW, please send patches inline by git-send-email instead of attaching or 
appending them. And the description/explanation should be part of the patch, 
not a separate email - this text should be preserved in the repository's 
changelog.

Thanks again. Hope to see the updated patches from you soon.

-- 
Denys


> From 6d6e03140ed67d9d1c4bb2fb79929a2a99bfe708 Mon Sep 17 00:00:00 2001
> From: Jingting Zhou <a0221004@ares-ubuntu>
> Date: Wed, 1 May 2013 18:12:31 -0400
> Subject: [PATCH] fixed the syslog-ng module-path problem
> 
> ---
> .../packagegroup-arago-base-tisdk-server-extra.bb  |    3 +-
> .../recipes-bsp/syslog-ng/files/initscript         |   45 ++++++
> .../recipes-bsp/syslog-ng/files/syslog-ng.conf     |  155 ++++++++++++++++++++
> .../recipes-bsp/syslog-ng/syslog-ng.inc            |  106 +++++++++++++
> .../recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb       |   11 ++
> 5 files changed, 319 insertions(+), 1 deletion(-)
> create mode 100755 meta-arago-extras/recipes-bsp/syslog-ng/files/initscript
> create mode 100755 meta-arago-extras/recipes-bsp/syslog-ng/files/syslog-ng.conf
> create mode 100755 meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
> create mode 100755 meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> index 6dbf8ee..650b190 100755
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> @@ -65,7 +65,8 @@ RDEPENDS_${PN} = "\
>      ${ARAGO_NDISC6} \
>      ptpd \
>      vsftpd \
> -    syslog-ng \
> +    syslog-ng \
> +    syslog-ng-plugins \
>      dtc \
>      strongswan \
>      strongswan-plugins \
> diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/files/initscript b/meta-arago-extras/recipes-bsp/syslog-ng/files/initscript
> new file mode 100755
> index 0000000..9adb4cc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/syslog-ng/files/initscript
> @@ -0,0 +1,45 @@
> +#! /bin/sh
> +#
> +# This is an init script for openembedded
> +# Copy it to /etc/init.d/syslog-ng and type
> +# > update-rc.d syslog-ng defaults 5
> +#
> +
> +
> +syslog_ng=/usr/sbin/syslog-ng
> +test -x "$syslog_ng" || exit 0
> +
> +case "$1" in
> +  start)
> +    echo -n "Starting syslog-ng:"
> +    start-stop-daemon --start --quiet --exec $syslog_ng
> +    echo "."
> +    ;;
> +  stop)
> +    echo -n "Stopping syslog-ng:"
> +    start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
> +    echo "."
> +    ;;
> +  reload|force-reload)
> +    start-stop-daemon --stop --quiet --signal 1 --exec $syslog_ng
> +    ;;
> +  restart)
> +    echo "Stopping syslog-ng:"
> +    start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
> +    echo -n "Waiting for syslog-ng to die off"
> +    for i in 1 2 3 ;
> +    do
> +        sleep 1
> +        echo -n "."
> +    done
> +    echo ""
> +    echo -n "Starting syslog-ng:"
> +    start-stop-daemon --start --quiet --exec $syslog_ng
> +    echo "."
> +    ;;
> +  *)
> +    echo "Usage: /etc/init.d/syslog-ng {start|stop|reload|restart|force-reload}"
> +    exit 1
> +esac
> +
> +exit 0
> diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/files/syslog-ng.conf b/meta-arago-extras/recipes-bsp/syslog-ng/files/syslog-ng.conf
> new file mode 100755
> index 0000000..e760dfb
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/syslog-ng/files/syslog-ng.conf
> @@ -0,0 +1,155 @@
> +@version: 3.2
> +#
> +# Syslog-ng configuration file, compatible with default Debian syslogd
> +# installation. Originally written by anonymous (I can't find his name)
> +# Revised, and rewrited by me (SZALAY Attila <sasa@debian.org>)
> +
> +# First, set some global options.
> +options { long_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no);
> +               owner("root"); group("adm"); perm(0640); stats_freq(0);
> +               bad_hostname("^gconfd$");
> +};
> +
> +########################
> +# Sources
> +########################
> +# This is the default behavior of sysklogd package
> +# Logs may come from unix stream, but not from another machine.
> +#
> +source s_src { unix-dgram("/dev/log"); internal();
> +                  file("/proc/kmsg" program_override("kernel"));
> +};
> +
> +# If you wish to get logs from remote machine you should uncomment
> +# this and comment the above source line.
> +#
> +#source s_net { tcp(ip(127.0.0.1) port(1000) authentication(required) encrypt(allow)); };
> +
> +########################
> +# Destinations
> +########################
> +# First some standard logfile
> +#
> +destination d_auth { file("/var/log/auth.log"); };
> +destination d_cron { file("/var/log/cron.log"); };
> +destination d_daemon { file("/var/log/daemon.log"); };
> +destination d_kern { file("/var/log/kern.log"); };
> +destination d_lpr { file("/var/log/lpr.log"); };
> +destination d_mail { file("/var/log/mail.log"); };
> +destination d_syslog { file("/var/log/syslog"); };
> +destination d_user { file("/var/log/user.log"); };
> +destination d_uucp { file("/var/log/uucp.log"); };
> +
> +# This files are the log come from the mail subsystem.
> +#
> +destination d_mailinfo { file("/var/log/mail/mail.info"); };
> +destination d_mailwarn { file("/var/log/mail/mail.warn"); };
> +destination d_mailerr { file("/var/log/mail/mail.err"); };
> +
> +# Logging for INN news system
> +#
> +destination d_newscrit { file("/var/log/news/news.crit"); };
> +destination d_newserr { file("/var/log/news/news.err"); };
> +destination d_newsnotice { file("/var/log/news/news.notice"); };
> +
> +# Some `catch-all' logfiles.
> +#
> +destination d_debug { file("/var/log/debug"); };
> +destination d_error { file("/var/log/error"); };
> +destination d_messages { file("/var/log/messages"); };
> +
> +# The root's console.
> +#
> +destination d_console { usertty("root"); };
> +
> +# Virtual console.
> +#
> +destination d_console_all { file("/dev/tty10"); };
> +
> +# The named pipe /dev/xconsole is for the nsole' utility.  To use it,
> +# you must invoke nsole' with the -file' option:
> +#
> +#    $ xconsole -file /dev/xconsole [...]
> +#
> +destination d_xconsole { pipe("/dev/xconsole"); };
> +
> +# Send the messages to an other host
> +#
> +#destination d_net { tcp("127.0.0.1" port(1000) authentication(on) encrypt(on) log_fifo_size(1000)); };
> +
> +# Debian only
> +destination d_ppp { file("/var/log/ppp.log"); };
> +
> +########################
> +# Filters
> +########################
> +# Here's come the filter options. With this rules, we can set which
> +# message go where.
> +
> +filter f_dbg { level(debug); };
> +filter f_info { level(info); };
> +filter f_notice { level(notice); };
> +filter f_warn { level(warn); };
> +filter f_err { level(err); };
> +filter f_crit { level(crit .. emerg); };
> +
> +filter f_debug { level(debug) and not facility(auth, authpriv, news, mail); };
> +filter f_error { level(err .. emerg) ; };
> +filter f_messages { level(info,notice,warn) and
> +                    not facility(auth,authpriv,cron,daemon,mail,news); };
> +
> +filter f_auth { facility(auth, authpriv) and not filter(f_debug); };
> +filter f_cron { facility(cron) and not filter(f_debug); };
> +filter f_daemon { facility(daemon) and not filter(f_debug); };
> +filter f_kern { facility(kern) and not filter(f_debug); };
> +filter f_lpr { facility(lpr) and not filter(f_debug); };
> +filter f_local { facility(local0, local1, local3, local4, local5,
> +                        local6, local7) and not filter(f_debug); };
> +filter f_mail { facility(mail) and not filter(f_debug); };
> +filter f_news { facility(news) and not filter(f_debug); };
> +filter f_syslog3 { not facility(auth, authpriv, mail) and not filter(f_debug); };
> +filter f_user { facility(user) and not filter(f_debug); };
> +filter f_uucp { facility(uucp) and not filter(f_debug); };
> +
> +filter f_cnews { level(notice, err, crit) and facility(news); };
> +filter f_cother { level(debug, info, notice, warn) or facility(daemon, mail); };
> +
> +filter f_ppp { facility(local2) and not filter(f_debug); };
> +filter f_console { level(warn .. emerg); };
> +
> +########################
> +# Log paths
> +########################
> +log { source(s_src); filter(f_auth); destination(d_auth); };
> +log { source(s_src); filter(f_cron); destination(d_cron); };
> +log { source(s_src); filter(f_daemon); destination(d_daemon); };
> +log { source(s_src); filter(f_kern); destination(d_kern); };
> +log { source(s_src); filter(f_lpr); destination(d_lpr); };
> +log { source(s_src); filter(f_syslog3); destination(d_syslog); };
> +log { source(s_src); filter(f_user); destination(d_user); };
> +log { source(s_src); filter(f_uucp); destination(d_uucp); };
> +
> +log { source(s_src); filter(f_mail); destination(d_mail); };
> +#log { source(s_src); filter(f_mail); filter(f_info); destination(d_mailinfo); };
> +#log { source(s_src); filter(f_mail); filter(f_warn); destination(d_mailwarn); };
> +#log { source(s_src); filter(f_mail); filter(f_err); destination(d_mailerr); };
> +
> +log { source(s_src); filter(f_news); filter(f_crit); destination(d_newscrit); };
> +log { source(s_src); filter(f_news); filter(f_err); destination(d_newserr); };
> +log { source(s_src); filter(f_news); filter(f_notice); destination(d_newsnotice); };
> +#log { source(s_src); filter(f_cnews); destination(d_console_all); };
> +#log { source(s_src); filter(f_cother); destination(d_console_all); };
> +
> +#log { source(s_src); filter(f_ppp); destination(d_ppp); };
> +
> +log { source(s_src); filter(f_debug); destination(d_debug); };
> +log { source(s_src); filter(f_error); destination(d_error); };
> +log { source(s_src); filter(f_messages); destination(d_messages); };
> +
> +log { source(s_src); filter(f_console); destination(d_console_all);
> +                                                                 destination(d_xconsole); };
> +log { source(s_src); filter(f_crit); destination(d_console); };
> +
> +# All messages send to a remote site
> +#
> +#log { source(s_src); destination(d_net); };
> diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
> new file mode 100755
> index 0000000..69157b1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng.inc
> @@ -0,0 +1,106 @@
> +DESCRIPTION = "Alternative system logger daemon"
> +DEPENDS = "libol flex eventlog glib-2.0"
> +LICENSE = "GPL LGPL"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7ec1bcc46f28b11f4722e20d9b7dd4d5"
> +
> +# syslog initscript is handled explicitly because order of
> +# update-rc.d and update-alternatives is important
> +RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
> +
> +INC_PR = "r10"
> +
> +inherit autotools
> +
> +SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source/${PN}_${PV}.tar.gz"
> +
> +noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6', d)}"
> +
> +EXTRA_OECONF = " \
> +  --with-libnet=${STAGING_BINDIR_CROSS} \
> +  --enable-dynamic-linking \
> +  ${noipv6} \
> +  --enable-ssl \
> +  --disable-sub-streams \
> +  --disable-pacct \
> +  --disable-linux-caps \
> +  --disable-pcre \
> +  --disable-sql \
> +  --disable-tcp-wrapper \
> +"
> +
> +do_configure_prepend() {
> +                             eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
> +}
> +
> +# rename modules.conf because it breaks update-modules
> +# see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035537.html
> +
> +do_compile_prepend() {
> +             cd ${WORKDIR}/syslog-ng-3.2.5/
> +             sed -i "s/\#define PATH\_MODULEDIR \"\/usr\/lib\/syslog-ng\"/\#define PATH\_MODULEDIR \"\/usr\/lib\/syslog-ng\/plugins\"/" config.h
> +             cd -
> +}
> +
> +do_install_append() {
> +        mv ${D}/${sysconfdir}/modules.conf ${D}/${sysconfdir}/scl-modules.conf
> +        sed -i "s#@include 'modules.conf'#@include 'scl-modules.conf'#g" ${D}/${sysconfdir}/scl.conf
> +        install -d ${D}/${sysconfdir}/${PN}
> +        install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf
> +        install -d ${D}/${sysconfdir}/init.d
> +        install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
> +                             mkdir ${D}/${libdir}/syslog-ng/plugins/
> +                             mv ${D}/${libdir}/syslog-ng/*.so ${D}/${libdir}/syslog-ng/plugins/
> +}
> +
> +PACKAGES += "${PN}-plugins"
> +FILES_${PN}-plugins += "${libdir}/syslog-ng/plugins/*.so"
> +INSANE_SKIP_${PN}-plugins = "dev-so"
> +
> +FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
> +            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
> +            ${base_bindir}/* ${base_sbindir}/* \
> +            ${base_libdir}/*${SOLIBS} \
> +            ${datadir}/${BPN} \
> +            ${datadir}/include/scl/ ${datadir}/xsd"
> +
> +FILES_${PN}-dev += "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIBSDEV}"
> +CONFFILES_${PN} = "${sysconfdir}/${PN}.conf ${sysconfdir}/scl.conf ${sysconfdir}/scl-modules.conf"
> +
> +pkg_postinst_${PN} () {
> +        /etc/init.d/syslog stop
> +        update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 200
> +
> +        if test "x$D" != "x"; then
> +                OPT="-r $D"
> +        else
> +                OPT="-s"
> +        fi
> +        # remove all rc.d-links potentially created from alternative
> +        # syslog packages before creating new ones
> +        update-rc.d $OPT -f syslog remove
> +        update-rc.d $OPT syslog start 20 2 3 4 5 . stop 90 0 1 6 .
> +}
> +
> +pkg_prerm_${PN} () {
> +        if test "x$D" = "x"; then
> +                if test "$1" = "upgrade" -o "$1" = "remove"; then
> +                        /etc/init.d/syslog stop
> +                fi
> +        fi
> +
> +        update-alternatives --remove syslog-init syslog.${PN}
> +}
> +
> +pkg_postrm_${PN} () {
> +        if test "x$D" != "x"; then
> +                OPT="-r $D"
> +        else
> +                OPT=""
> +        fi
> +        if test "$1" = "remove" -o "$1" = "purge"; then
> +                if ! test -e "/etc/init.d/syslog"; then
> +                        update-rc.d $OPT syslog remove
> +                fi
> +        fi
> +}
> +
> diff --git a/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb
> new file mode 100755
> index 0000000..5446658
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/syslog-ng/syslog-ng_3.2.5.bb
> @@ -0,0 +1,11 @@
> +require syslog-ng.inc
> +PR = "${INC_PR}.1"
> +
> +SRC_URI += " \
> +  file://syslog-ng.conf \
> +  file://initscript \
> +"
> +
> +SRC_URI[md5sum] = "60737452ce898f9dc7170dfdc9bfd732"
> +SRC_URI[sha256sum] = "ffc9f3a0ebea836c1c737b1ff49efe731d885af1d8aacf9eca79d9144eeefa89"
> +
> \ No newline at end of file
> --
> 1.7.9.5
> 

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


